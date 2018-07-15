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
    var thirdView: TViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // test -------
        firstView = FViewController()
        secondView = SViewController()
        thirdView = TViewController()
        
        //表示するtabItemを指定（今回はデフォルトのItemを使用）
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)
        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 2)
        thirdView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.search, tag: 3)
        
        // タブで表示するViewControllerを配列に格納します。
        let uiv: [UIViewController] = [firstView!, secondView!, thirdView!]
        
        // 配列をTabにセットします。
        self.setViewControllers(uiv, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
