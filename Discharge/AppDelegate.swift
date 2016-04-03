//
//  AppDelegate.swift
//  Discharge
//
//  Created by Pat Sukhum on 3/12/16.
//  Copyright © 2016 Pat Sukhum. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.

        // Pasted code
        let endGameAction = UIMutableUserNotificationAction()
        endGameAction.identifier = "END_GAME"
        endGameAction.title = "End Game"
        endGameAction.activationMode = .Background
        endGameAction.authenticationRequired = false
        endGameAction.destructive = true
        
        let continueGameAction = UIMutableUserNotificationAction()
        continueGameAction.identifier = "CONTINUE_GAME"
        continueGameAction.title = "Continue"
        continueGameAction.activationMode = .Foreground
        continueGameAction.authenticationRequired = false
        continueGameAction.destructive = false
        
        let restartGameCategory = UIMutableUserNotificationCategory()
        restartGameCategory.identifier = "RESTART_CATEGORY"
        restartGameCategory.setActions([continueGameAction, endGameAction], forContext: .Default)
        restartGameCategory.setActions([endGameAction, continueGameAction], forContext: .Minimal)
        
        let categories = Set<UIUserNotificationCategory>(arrayLiteral: restartGameCategory)
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: categories)
        application.registerUserNotificationSettings(settings)
        // Paste ends
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

