//
//  SceneDelegate.swift
//  Swift_sqliteSwift
//
//  Created by jdj on 2020/04/13.
//  Copyright © 2020 qure. All rights reserved.
//

import UIKit
import SwiftUI
import SQLite

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        print("aaa")
        
        //        let fileName = "holybible.db"
        //        let documentsPathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //
        //
        //        let destinationPath = documentsPathURL.appendingPathComponent(fileName).path
        //        let fileManager = FileManager.default
        //        //if active db not found then continue otherwise exit
        //        guard !fileManager.fileExists(atPath: destinationPath) else {
        //            print("error fileExists")
        //            return
        //
        //        }
        //        //form a valid URL to resource or exit
        //        guard let fromURL = Bundle.main.resourceURL?.appendingPathComponent(fileName) else {
        //            print("fromURL")
        //            return
        //
        //        }
        //        //if reference db exists continue otherwise exit
        //        guard fileManager.fileExists(atPath: fromURL.path) else {
        //            print("fileExists")
        //            return
        //
        //        }
        //        //try to copy item or exit with error
        //        do {
        //          try fileManager.copyItem(atPath: fromURL.path, toPath: destinationPath)
        //          debugPrint("file copied?: \(fileManager.fileExists(atPath: destinationPath))")
        //          } catch {
        //          debugPrint(error)
        //        }
        //
        
        
        
        let path = Bundle.main.path(forResource: "holybible", ofType: "db")!

        let db = try! Connection(path, readonly: true)
        
        let users = Table("bibles")
        let id = Expression<Int64>("_id")
        let name = Expression<String?>("vcode")
        let email = Expression<String>("type")
        
        for user in try! db.prepare(users) {
            print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
            // id: 1, name: Optional("Alice"), email: alice@mac.com
        }
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

