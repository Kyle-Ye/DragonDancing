//
//  MeetingGameScene.swift
//  Demo
//
//  Created by Kyle on 2021/5/8.
//

import AVFoundation
import SpriteKit

class GameScene: SKScene {
    static var world: MeetingWorld!
    var skipable = false
    var conversation: SKSpriteNode?

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        if skipable {
            conversation?.removeFromParent()
            skipable = false
            if GameScene.world.collectedObjects.count == 9 {
                view?.presentScene(GameScene.gameoverRoom, transition: .crossFade(withDuration: 2))
                GameScene.world.showBag = false
            }
            return
        }
        if let name = name, name == "loading" {
            view?.presentScene(GameScene.introRoom, transition: .crossFade(withDuration: 2))
        } else if let name = name, name == "introRoom" {
            view?.presentScene(GameScene.meetingRoom, transition: .crossFade(withDuration: 2))
        } else if let root = childNode(withName: "root") {
            let location = touch.location(in: root)
            if let indicator = root.childNode(withName: "indicator_bookRoom") {
                if indicator.frame.contains(location) {
                    view?.presentScene(GameScene.bookRoom, transition: .crossFade(withDuration: 2))
                }
            }
            if let indicator = root.childNode(withName: "indicator_meetingRoom") {
                if indicator.frame.contains(location) {
                    view?.presentScene(GameScene.meetingRoom, transition: .crossFade(withDuration: 2))
                }
            }
            if let indicator = root.childNode(withName: "indicator_instrumentRoom") {
                if indicator.frame.contains(location) {
                    view?.presentScene(GameScene.instrumentRoom, transition: .crossFade(withDuration: 2))
                }
            }
            if let indicator = root.childNode(withName: "indicator_playgroundRoom") {
                if indicator.frame.contains(location) {
                    view?.presentScene(GameScene.playgroundRoom, transition: .crossFade(withDuration: 2))
                }
            }
        }
        if let objects = childNode(withName: "objects") {
            let location = touch.location(in: objects)
            for child in objects.children {
                if child.frame.contains(location) {
                    if let name = child.name {
                        if name.hasPrefix("object") {
                            if !GameScene.world.collectedObjects.contains(name) {
                                GameScene.world.collectedObjects.append(name)
                                conversation = GameScene.conversation_success
                                addChild(conversation!)
                                skipable = true
                            }
                        } else {
                            conversation = GameScene.conversation_fall
                            addChild(conversation!)
                            skipable = true
                        }
                    }
                }
            }
        }
    }

    var video: SKVideoNode!

    override func sceneDidLoad() {
        if let name = name, name == "introRoom" {
            GameScene.world.showBag = true
        }

        if let name = name, name == "gameoverRoom" {
            let url: URL = Bundle.main.url(forResource: "meeting", withExtension: "mp4")!
            let player = AVPlayer(url: url)
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                                   object: nil,
                                                   queue: nil) { _ in
                player.seek(to: .zero)
                player.play()
            }
            let video = SKVideoNode(avPlayer: player)
            video.play()
            addChild(video)
        }
    }
}

extension GameScene {
    static let loading = GameScene(fileNamed: "loading")!
    static let introRoom = GameScene(fileNamed: "introRoom")!
    static let bookRoom = GameScene(fileNamed: "bookRoom")!
    static let meetingRoom = GameScene(fileNamed: "meetingRoom")!
    static let instrumentRoom = GameScene(fileNamed: "instrumentRoom")!
    static let playgroundRoom = GameScene(fileNamed: "playgroundRoom")!
    static let gameoverRoom = GameScene(fileNamed: "gameoverRoom")!

    static let conversation_fall = SKSpriteNode(imageNamed: "conver_fail")
    static let conversation_success = SKSpriteNode(imageNamed: "conver_success")
    static let conversation_intro = SKSpriteNode(imageNamed: "conver_intro")
}
