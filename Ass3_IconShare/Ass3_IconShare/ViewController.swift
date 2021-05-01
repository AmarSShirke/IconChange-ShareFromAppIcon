//
//  ViewController.swift
//  Ass3_IconShare
//
//  Created by Amar Shirke on 29/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        NotificationCenter.default.addObserver(self, selector: #selector(shareUrlCall), name: Notification.Name("ShareUrl"), object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(changeIconCall), name: Notification.Name("IconChange"), object: nil)

    }
    

    @objc func changeIconCall(){
        
        let boolValue = UserDefaults.standard.bool(forKey: "isIconSet")
        
        if boolValue {

            //changeIcon(to: nil)
            UserDefaults.standard.set(false, forKey: "isIconSet")
            //changeIcon(to: "AppIconAlternate2")
            changeIcon(to: nil)
            
        }else{
            
            UserDefaults.standard.set(true, forKey: "isIconSet")
            changeIcon(to: "AppIconAlternate1")
        }
    }



    @objc func shareUrlCall(){
        print("notificationCall")
        //self.view.backgroundColor = UIColor.red
        
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)

    }
    
    func changeIcon(to name: String?) {
        //Check if the app supports alternating icons
        guard UIApplication.shared.supportsAlternateIcons else {
            return;
        }
        
        //Change the icon to a specific image with given name
        UIApplication.shared.setAlternateIconName(name) { (error) in
            //After app icon changed, print our error or success message
            if let error = error {
                print("App icon failed to due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully.")
            }
        }
    }
    
}

