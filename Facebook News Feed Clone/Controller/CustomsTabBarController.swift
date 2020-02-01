//
//  CustomsTabBarController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/19/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class LightNavBar: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        let newsFeedController = LightNavBar(rootViewController: NewsFeedController(collectionViewLayout: layout))
        newsFeedController.tabBarItem.image = UIImage(named: "news-feed-icon")
        
        let liveController = LiveController()
        liveController.tabBarItem.image = UIImage(named: "facebook-live-icon")
        
        let marketplaceController = MarketplaceController()
        marketplaceController.tabBarItem.image = UIImage(named: "market-place-icon")
        
        let notificationsController = NotificationsController()
        notificationsController.tabBarItem.image = UIImage(named: "notification-icon")
        
        let moreController = MoreController()
        moreController.tabBarItem.image = UIImage(named: "more-icon")
        
        viewControllers = [newsFeedController, liveController, marketplaceController, notificationsController, moreController]
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white

        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1.0).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
}
