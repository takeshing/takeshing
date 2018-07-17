//
//  TViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/16.
//  Copyright © 2018年 thunder_healthy_political_party. All rights reserved.
//

import UIKit

class TViewController:UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    var viewBottom:UITableView!
    var txt:UITextField!
    var btn:UIButton!
    var items: [String] = ["あああああ", "いいいいいい", "ううううう", "ええええええ", "おおおおお"]
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewTop:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 110))
        viewTop.backgroundColor = UIColor.lightGray
        txt = UITextField()
        txt.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 30, width: 300, height:30)
        txt.borderStyle = UITextBorderStyle.roundedRect  // ボーダー
        txt.returnKeyType = UIReturnKeyType.done   // Enterキーの」実効タイプ
        txt.placeholder = "サンダー元気党入力フォーム"   // プレースホルダー
        txt.delegate = self
        
        btn = UIButton()
        btn.setTitle("お試しボタン", for: UIControlState.normal)
        btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btn.setTitle("Tapped!", for: UIControlState.highlighted)
        btn.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1        //サイズ
        btn.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 70, width: 120, height:30)
        // タップされたときのaction
        btn.addTarget( self,
                         action: #selector(TViewController.buttonTapped(sender:)),
                         for: .touchUpInside)
        
        viewTop.addSubview(txt)
        viewTop.addSubview(btn)
        
        self.view.addSubview(viewTop)
        
        // UITableView
        viewBottom = UITableView()
        viewBottom.frame = CGRect(x: 0, y: 110, width: self.view.frame.width, height: self.view.frame.height - 110)
        viewBottom.delegate = self
        viewBottom.dataSource = self
        viewBottom.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(viewBottom)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func buttonTapped(sender : AnyObject) {
        print("buttonTapped")
    }
    // 完了してテキストフィールドを閉じる
    func textFieldShouldReturn(_ tf:UITextField) -> Bool{
        tf.resignFirstResponder()
        return true
    }
    //UITextFieldの編集後に処理を行う
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルを選択しました！ #\(indexPath.row)!")
    }
}
