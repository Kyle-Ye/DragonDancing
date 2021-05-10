//
//  ActionVideoScene.swift
//  Demo4
//
//  Created by Kyle on 2021/5/10.
//

import AVFoundation
import SpriteKit
import SwiftUI

class ActionVideoScene: SKScene {
    var videoName: String = ""
    
    var video: SKVideoNode!
    
    init(name: String,size: CGSize) {
        videoName = name
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        backgroundColor = UIColor(named: "background")!
        view?.contentMode = .scaleAspectFit
        let url: URL = Bundle.main.url(forResource: videoName, withExtension: "mp4")!
        let player = AVPlayer(url: url)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: nil,
                                               queue: nil) { _ in
            player.seek(to: .zero)
            player.play()
        }
        let video = SKVideoNode(avPlayer: player)
        video.anchorPoint = .zero
        video.position = CGPoint(x: video.position.x + 20, y: video.position.y + 20)
        video.play()
        video.setScale(0.7)
        addChild(video)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        print(size)
    }
}
