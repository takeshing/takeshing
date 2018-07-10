//
//  MainTabBarController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/08.
//
import UIKit
class MainTabBarController: UITabBarController {
    var firstView: FViewController!
    var secondView: SViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // test -------
        firstView = FViewController()
        secondView = SViewController()
        
        //表示するtabItemを指定（今回はデフォルトのItemを使用）
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)
        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 2)
        
        // タブで表示するViewControllerを配列に格納します。
        let uiv: [UIViewController] = [firstView!, secondView!]
        
        // 配列をTabにセットします。
        self.setViewControllers(uiv, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
