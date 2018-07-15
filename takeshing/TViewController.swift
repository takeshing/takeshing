//
//  TViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/16.
//  Copyright © 2018年 thunder_healthy_political_party. All rights reserved.
//

import UIKit

class TViewController:UIViewController,UITextFieldDelegate,UIScrollViewDelegate,UITableViewDelegate{
    var scroll:UIScrollView!
    var txt:UITextField!
    var btn: UIButton!
    var table:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scroll = UIScrollView()
        scroll.backgroundColor = UIColor.white
        scroll.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        scroll.center = self.view.center
        scroll.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        scroll.bounces = false
        scroll.indicatorStyle = UIScrollViewIndicatorStyle.black
        scroll.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        scroll.delegate = self

        txt = UITextField()
        txt.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 10, width: 300, height:30)
        txt.borderStyle = UITextBorderStyle.roundedRect  // ボーダー
        txt.returnKeyType = UIReturnKeyType.done   // Enterキーの」実効タイプ
        txt.placeholder = "サンダー元気党入力フォーム"   // プレースホルダー
        txt.delegate = self
        scroll.addSubview(txt)
        
        btn = UIButton()
        btn.setTitle("ランキング", for: UIControlState.normal)
        btn.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 40, width: 100, height:30)
        scroll.addSubview(btn)
        self.view = scroll
    }
}
