//
//  SealTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import SwiftUI

struct SealTab: View {
    @EnvironmentObject var model: SealWorld
    @State var singleSelectedSeal: Seal?

    var body: some View {
        HStack {
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        Image(model.background[model.activeBackground])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        ForEach(model.seals) { seal in
                            SealView(seal)
                                .position(position(for: seal, in: geometry.size))
                                .gesture(singleTapToSelect(for: seal))
                                .gesture(sealPanGesture(for: seal))
                                .zIndex(isSealSelected(seal) ? 1 : 0)
                        }
                    }
                    .frame(width: geometry.size.width,
                           height: geometry.size.height,
                           alignment: .center)
                    .clipped()
                    .snapshot(model.captureImage, completion: { image in
                        model.captureImage.toggle()
                        model.shareImage = image
                        model.showShareSheet = true
                    })
                    .gesture(zoomGesture())
                    .onDrop(of: ["public.text"], isTargeted: nil) { providers, location in
                        var location = geometry.convert(location, from: .global, ignoreHorizontal: true)
                        location = location - geometry.size / 2
                        return self.drop(providers: providers, at: location)
                    }
                }
                .border(Color.accentColor, width: 6)
                .frame(width: 726, height: 726)
                .contextMenu {
                    Button(action: {
                        model.captureImage.toggle()
                    }) {
                        Text("分享")
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .sheet(isPresented: $model.showShareSheet){
                    ActivityView(image: model.shareImage!)
                }
                .padding(.top, 80)
                .padding(.horizontal, 30)
                HStack(spacing: 60) {
                    ForEach(model.background.indices) { index in
                        Image(model.background[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .onTapGesture {
                                model.activeBackground = index
                            }
                    }
                }
                .padding(.bottom, 50)
                .padding(.top, 50)
            }
            Spacer()
            VStack {
                HStack {
                    VStack {
                        ForEach(0 ..< 5) { index in
                            Image("印章浅色-\(index + 1)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .onDrag {
                                    NSItemProvider(object: "印章浅色-\(index + 1)" as NSString)
                                }
                        }
                    }
                    Divider()
                    VStack {
                        ForEach(0 ..< 5) { index in
                            Image("印章粉色-\(index + 1)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .onDrag {
                                    NSItemProvider(object: "印章粉色-\(index + 1)" as NSString)
                                }
                        }
                    }
                }
                .frame(height: 600)
                HStack(spacing: 80) {
                    Image("分享")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            model.captureImage.toggle()
                        }
                    Image("重置")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            model.activeBackground = 0
                            model.seals.removeAll()
                            model.selectedSeals.removeAll()
                        }
                }
            }
            .padding(.horizontal, 100)
        }
    }

    // MARK: - Position And Size

    private func SealView(_ seal: Seal) -> some View {
        ZStack(alignment: .topLeading) {
            Image(seal.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: font(for: seal))
                .shadow(color: isSealSelected(seal) ? .primary : .clear, radius: 10)
                .padding(.all, 8)
            if isSealSelected(seal) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
                    .background(Color.white)
                    .font(animatableWithSize: deleteFont(for: seal))
                    .clipShape(Circle())
                    .onTapGesture {
                        model.deleteSeal(seal)
                    }
            }
        }
    }

    private let defaultEmojiSize: CGFloat = 40
    private let deleteSizeFactor: CGFloat = 0.2
    private func font(for seal: Seal) -> CGFloat {
        80.0 * seal.fontSize * (isSealSelected(seal) ? gestureZoomScale : 1.0)
    }

    private func deleteFont(for seal: Seal) -> CGFloat {
        max(seal.fontSize * (isSealSelected(seal) ? gestureZoomScale : 1.0) * deleteSizeFactor, 18)
    }

    private func position(for seal: Seal, in size: CGSize) -> CGPoint {
        seal.location + size / 2 + (((singleSelectedSeal == nil && isSealSelected(seal)) || seal == singleSelectedSeal) ? selectedSealPanOffset : .zero)
    }

    // MARK: - Drop

    private let defaultSealSize = 1.0
    private func drop(providers: [NSItemProvider], at location: CGPoint) -> Bool {
        let found = providers.loadObjects(ofType: String.self) { string in
            model.addSeal(string, at: location, size: defaultSealSize)
        }
        return found
    }

    // MARK: - SealPanGesture

    @GestureState private var sealGesturePanOffset: CGSize = .zero

    private var selectedSealPanOffset: CGSize {
        sealGesturePanOffset
    }

    private func sealPanGesture(for seal: Seal) -> some Gesture {
        DragGesture()
            .onChanged { _ in
                if !isSealSelected(seal) {
                    singleSelectedSeal = seal
                }
            }
            .updating($sealGesturePanOffset) { latestGestureOffset, gesturePanOffset, _ in
                gesturePanOffset = latestGestureOffset.translation
            }
            .onEnded { finalPanOffset in
                if isSealSelected(seal) {
                    for seal in model.selectedSeals {
                        model.moveSeal(seal, by: finalPanOffset.translation)
                    }
                } else {
                    singleSelectedSeal = nil
                    model.moveSeal(seal, by: finalPanOffset.translation)
                }
            }
    }

    // MARK: - ZoomGesture

    @GestureState private var gestureZoomScale: CGFloat = 1.0

    private func zoomGesture() -> some Gesture {
        MagnificationGesture()
            .updating($gestureZoomScale) { latestGestureScale, gestureZoomScale, _ in
                gestureZoomScale = latestGestureScale
            }
            .onEnded { finalGestureScale in
                for seal in model.selectedSeals {
                    model.scaleSeal(seal, by: Double(finalGestureScale))
                }
            }
    }

    // MARK: - TapGesture

    private func isSealSelected(_ seal: Seal) -> Bool {
        model.selectedSeals.contains(seal)
    }

    private func singleTapToSelect(for seal: Seal?) -> some Gesture {
        TapGesture(count: 1)
            .onEnded {
                withAnimation(.spring()) {
                    if let seal = seal {
                        model.selectedSeals.toggleMatching(seal)
                    } else {
                        model.selectedSeals.removeAll()
                    }
                }
            }
    }
}

struct SealTab_Previews: PreviewProvider {
    static var previews: some View {
        SealTab()
            .environmentObject(SealWorld())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
