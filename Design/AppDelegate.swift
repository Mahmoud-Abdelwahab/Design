//
//  AppDelegate.swift
//  Design
//
//  Created by kasper on 7/15/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//        window?.rootViewController =  LanguagesVC(nibName: "LanguagesVC", bundle: nil)
//
//          self.window?.makeKeyAndVisible()
        
        LocalizationManger.shared.delegate = self
        LocalizationManger.shared.setAppInintialLanguage()
        return true
    }
    
 
    
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate : LocalizationDelegate{
    func resetApp() {
        guard let window = window else{return}
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        window.rootViewController = vc
        let option : UIView.AnimationOptions = .transitionCrossDissolve
        let duration :TimeInterval = 0.3
        UIView.transition(with: window, duration: duration, options: option, animations: nil, completion: nil)
    }
    
    
}
