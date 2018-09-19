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
        newsFeedController.tabBarItem.image = UIImage(named: "news_feed_icon")
        newsFeedController.title = "News Feed"
        
        let requestsController = RequestsController()
        requestsController.tabBarItem.image = UIImage(named: "requests_icon")
        requestsController.title = "Requests"
        
        let messengerController = MessengerController()
        messengerController.tabBarItem.image = UIImage(named: "messenger_icon")
        messengerController.title = "Messenger"
        
        let notificationsController = NotificationsController()
        notificationsController.tabBarItem.image = UIImage(named: "globe_icon")
        notificationsController.title = "Notifications"
        
        let moreController = MoreController()
        moreController.tabBarItem.image = UIImage(named: "more_icon")
        moreController.title = "More"
        
        viewControllers = [newsFeedController, requestsController, messengerController, notificationsController, moreController]
        
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1.0).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
}
