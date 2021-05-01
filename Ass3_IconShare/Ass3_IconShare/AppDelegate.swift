//
//  AppDelegate.swift
//  Ass3_IconShare
//
//  Created by Amar Shirke on 29/04/21.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.setAlternateIconName("Chutaki", completionHandler: nil)
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
        // Saves changes in the application's managed object context before the application terminates.
        
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        print("long press")
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
       
        switch shortcutItem.type {
        case "IconAction":
            print("share")
            
            let boolValue = UserDefaults.standard.bool(forKey: "isIconSet")
            if boolValue {

                let alert = UIAlertController(title: "Change Icon", message: "App Icon reset Successfully", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                    guard let vc = self.window?.rootViewController as? ViewController else { return }
                    
                    let boolValue = UserDefaults.standard.bool(forKey: "isIconSet")
                    
                    if boolValue {

                        UserDefaults.standard.set(false, forKey: "isIconSet")
                        //changeIcon(to: "AppIconAlternate2")
                        vc.changeIcon(to: nil)
                        
                    }else{
                        
                        UserDefaults.standard.set(true, forKey: "isIconSet")
                        vc.changeIcon(to: "AppIconAlternate1")
                    }
                    
                }
                let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(okAction)
                alert.addAction(cancel)
                window?.rootViewController?.present(alert, animated: true, completion: nil)
                
            }else{
                
                let alert = UIAlertController(title: "Change Icon", message: "App Icon change Successfully", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                    guard let vc = self.window?.rootViewController as? ViewController else { return }
                    
                    let boolValue = UserDefaults.standard.bool(forKey: "isIconSet")
                    
                    if boolValue {

                        UserDefaults.standard.set(false, forKey: "isIconSet")
                        //changeIcon(to: "AppIconAlternate2")
                        vc.changeIcon(to: nil)
                        
                    }else{
                        
                        UserDefaults.standard.set(true, forKey: "isIconSet")
                        vc.changeIcon(to: "AppIconAlternate1")
                    }
                    
                }
                let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(okAction)
                alert.addAction(cancel)
                window?.rootViewController?.present(alert, animated: true, completion: nil)
                
            }
            

             
            
            //guard let vc = self.window?.rootViewController as? ViewController else { return }
            //vc.changeIconCall()
            
            break
            
        case "ShareAction":
            
            let urlString = URL(string: "https://www.apple.com")!

            let linkToShare = [urlString]

            let activityController = UIActivityViewController(activityItems: linkToShare, applicationActivities: nil)
            window?.rootViewController?.present(activityController, animated: true, completion: nil)
            break
            
        default:
            
            break
        }
    }

}

