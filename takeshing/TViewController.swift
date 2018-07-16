//
//  TViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/16.
//  Copyright © 2018年 thunder_healthy_political_party. All rights reserved.
//

import UIKit

class TViewController:UIViewController,UITextFieldDelegate,UIScrollViewDelegate{
    var scroll:UIScrollView!
    var txt:UITextField!
    var btn:UIButton!
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
        
        btn = UIButton()
        btn.setTitle("ランキング", for: UIControlState.normal)
        btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btn.setTitle("Tapped!", for: UIControlState.highlighted)
        btn.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1        //サイズ
        btn.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 50, width: 100, height:30)
        // タップされたときのaction
        btn.addTarget( self,
                         action: #selector(TViewController.buttonTapped(sender:)),
                         for: .touchUpInside)
        
        scroll.addSubview(txt)
        scroll.addSubview(btn)
        
        self.view = scroll
    }
    @objc func buttonTapped(sender : AnyObject) {
        print("buttonTapped")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // 完了してテキストフィールドを閉じる
    func textFieldShouldReturn(_ tf:UITextField) -> Bool{
        tf.resignFirstResponder()
        return true
    }
    //UITextFieldの編集後に処理を行う
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // スクロール中の処理
        print("didScroll")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // ドラッグ開始時の処理
        print("beginDragging")
    }
}
