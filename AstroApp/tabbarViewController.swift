//
//  tabbarViewController.swift
//  AstroApp
//
//  Created by Bircan Sezgin on 12.08.2023.
//

import UIKit

class tabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // secili oludugunda
        UITabBar.appearance().tintColor = UIColor.white
        // Tabbar ikonlarının seçili olmadığında kullanılacak
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        //UITabBar.appearance().barTintColor =  .systemGray
    }
    

 

}
