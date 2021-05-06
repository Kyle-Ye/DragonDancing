//
//  ShareView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/5.
//

import LinkPresentation
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }

    var image: UIImage
    var excludedActivityTypes: [UIActivity.ActivityType]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let source = Source(image: image)
        let controller = UIActivityViewController(activityItems: [source],
                                                  applicationActivities: nil)
        return controller
    }
}

class Source: NSObject {
    var shareImage: UIImage
    init(image: UIImage) {
        shareImage = image
    }
}

extension Source: UIActivityItemSource {
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return shareImage
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return shareImage
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let image = shareImage
        let imageProvider = NSItemProvider(object: image)
        let metadata = LPLinkMetadata()
        metadata.imageProvider = imageProvider
        metadata.title = "DIY狮头"
        return metadata
    }
}
