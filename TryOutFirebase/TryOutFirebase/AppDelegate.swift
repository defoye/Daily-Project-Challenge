//
//  AppDelegate.swift
//  TryOutFirebase
//
//  Created by Ernest DeFoy on 6/23/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FUIAuthDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = TableViewController()
		window?.makeKeyAndVisible()
		
		FirebaseApp.configure()
//		let authUI = FUIAuth.defaultAuthUI()
//
//		// You need to adopt a FUIAuthDelegate protocol to receive callback
//		authUI!.delegate = self
//		let providers: [FUIAuthProvider] = [
//			FUIGoogleAuth(),
//			FUIAnonymousAuth(),
//			FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
//		]
//		authUI!.providers = providers
		
//		let authViewController = authUI!.authViewController()
//		window?.rootViewController = authViewController
//		window?.rootViewController = ViewController()
		
		return true
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

extension AppDelegate {
//	func application(_ app: UIApplication, open url: URL,
//					 options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//		let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
//		if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
//			return true
//		}
//		// other URL handling goes here.
//		return false
//	}
	
//	func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//		let viewController = ViewController()
//		let dummy = UIViewController()
//		UIStoryboardSegue(identifier: "ViewController", source: dummy, destination: viewController)
//		print("signed in")
//	}
}