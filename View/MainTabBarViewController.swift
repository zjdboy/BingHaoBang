//
//  MainTabBarViewController.swift
//  BingHaoBang
//
//  Created by zhangjidong on 16/3/31.
//  Copyright © 2016年 Zjdboy. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllChildViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - 子视图
extension MainTabBarController{
    func addAllChildViewController(){
        // 首页
        addChildVC(IndexViewController(), title: "首页", image: "tabbar_home", selected: "tabbar_home_selected")
        // 发现
        addChildVC(FindViewController(), title: "发现", image: "tabbar_chat", selected: "tabbar_chat_selected")
        // 我的
        addChildVC(MyViewController(), title: "我的", image: "tabbar_me", selected: "tabbar_me_selected")
    }
    
    /**
     添加子视图控制器
     
     :param: childVC  NavigationViewController的根视图类型
     :param: title    tabbar item的文字
     :param: image    tabbar item的默认图片的名称
     :param: selected tabbar item的选中状态下图片的名称
     */
    func addChildVC(childVC: UIViewController, title: String?, image: String, selected: String) {
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named: selected)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        // 设置点击之后字体的颜色
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: GLOBAL_COLOR], forState:UIControlState.Selected)
        
        // 设置导航控制器
        let childNaviagation = UINavigationController(rootViewController: childVC)
        addChildViewController(childNaviagation)
    }
}

