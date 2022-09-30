//
//  tabBarViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/03.
//

import UIKit

class tabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //add controllers to the tabBar
        self.navigationController?.isNavigationBarHidden = true

        
        let testVC = TestViewController()
        let testVCBarItem = UITabBarItem(title: "검사", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        testVC.tabBarItem = testVCBarItem

        let homeVC = HomeViewController()
        let homeVCBarItem = UITabBarItem(title: "홈", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        homeVC.tabBarItem = homeVCBarItem
            
        let statisticsVC = BarGraphViewController()
        let statisticsVCBarItem2 = UITabBarItem(title: "통계", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        statisticsVC.tabBarItem = statisticsVCBarItem2

        let settingsVC = HomeViewController()
        let settingsVCBarItem = UITabBarItem(title: "설정", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        settingsVC.tabBarItem = settingsVCBarItem


        self.viewControllers = [testVC, homeVC, statisticsVC, settingsVC]
        
        self.selectedIndex = 1
    }

        // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected \(viewController.title!)")
    }
        
        
        
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


