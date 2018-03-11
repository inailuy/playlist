//
//  AppDelegate.swift
//  Playlist
//
//  Created by yulz on 3/11/18.
//  Copyright © 2018 yulz. All rights reserved.
//

import UIKit
import SpotifyLogin

// Your client ID
let kClientId = "914c0acc8e5448c0bc8d4700bacb7220"
let KClientSecret = "8acf2ef1e0374648b07a3a3e4b00d3b2"

// Your applications callback URL
let kCallbackURL = "spotifyOnWatch://"

let kSessionUserDefaultsKey = "SpotifyPlaylist"


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let redirectURL = URL(string: kCallbackURL)
        SpotifyLogin.shared.configure(clientID: kClientId, clientSecret: KClientSecret, redirectURL:redirectURL!)
        //SpotifyLogin.shared.logout()
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url)
        let handled = SpotifyLogin.shared.applicationOpenURL(url) { (error) in
            if (error != nil) {
                print(error.debugDescription)
            }
        }
        return handled
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

