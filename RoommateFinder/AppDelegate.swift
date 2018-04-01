//
//  AppDelegate.swift
//  RoommateFinder
//
//  Created by Brandon Lee, Harshil Shah, Kimmillie Tran on 3/31/18.
//  Copyright © 2018 Brandon Lee, Harshil Shah, Kimmillie Tran. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }
}

