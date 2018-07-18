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
    var items: [String] = ["あああああ", "いいいいいい", "ううううう", "ええええええ", "おおおおお", "かかっかかか", "kikikikikikikikikikikikikikikiki"]
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewTop:UIView = UIView()
        // Autolayoutを使うにあたりサイズ指定はconstraintで行う。
        // 制約は構造上のaddsubviewが先に行われている必要があるらしく、この前後性はコンパイルエラーにはならないが、
        // 実効時にエラーになる。これを避けるためUIの構築は、オブジェクトの生成を行い、プロパティを設定して、アッドして行ったのちに
        // 制約宣言していくとすべきという事になる。
        //UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 110))
        viewTop.translatesAutoresizingMaskIntoConstraints = false // これはデフォの誓約らしく、自己制約と競合するらしいので、オフにしておくべきらしい。
        viewTop.backgroundColor = UIColor.lightGray

        txt = UITextField()
        // 誓約に依存させる為、サイズ指定は行わない。
        // txt.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 30, width: 300, height:30)
        txt.translatesAutoresizingMaskIntoConstraints = false   // オブジェクト毎に毎度指定がいる模様。親で子弟されたら子もそれに習うべきだだろ。。。
        txt.borderStyle = UITextBorderStyle.roundedRect  // ボーダー
        txt.returnKeyType = UIReturnKeyType.done   // Enterキーの」実効タイプ
        txt.placeholder = "サンダー元気党入力フォーム"   // プレースホルダー
        txt.delegate = self
        
        btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false   // オブジェクト毎に毎度指定がいる模様。親で子弟されたら子もそれに習うべきだだろ。。。
        btn.setTitle("お試しボタン", for: UIControlState.normal)
        btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btn.setTitle("Tapped!", for: UIControlState.highlighted)
        btn.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1        //サイズ
        // 誓約に依存させる為、サイズ指定は行わない。
        // btn.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 70, width: 120, height:30)
        // タップされたときのaction
        btn.addTarget( self,
                         action: #selector(TViewController.buttonTapped(sender:)),
                         for: .touchUpInside)
        
        viewTop.addSubview(txt)
        viewTop.addSubview(btn)
        
        self.view.addSubview(viewTop)
        
        // UITableView
        viewBottom = UITableView()
        viewBottom.translatesAutoresizingMaskIntoConstraints = false

        // 誓約に依存させる為、サイズ指定は行わない。
        // viewBottom.frame = CGRect(x: 0, y: 110, width: self.view.frame.width, height: self.view.frame.height - 110)
        viewBottom.delegate = self
        viewBottom.dataSource = self
        viewBottom.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(viewBottom)

        // 誓約宣言
        // 基準点となるself.viewからの相対位置を指定していく。基準点に対して相対指定した物を基準にさらに別の相対位置を指定する感じ。
        // 制約の種類はある程度暗記しておくべきだろう。
        // leadingAnchor : 左端 = leftAnchorと同義らしいが、apple推奨はleadingらしい
        // trailingAnchor : 右端 = rightAnchorと同義らしいが、apple推奨はtrailingらしい
        // topAnchor : 上端
        // bottomAnchor : 下端
        // centerYAnchor : 縦軸中心
        // centerXAnchor : 横軸中心
        // heightAnchor : 高さ
        // widthAnchor : 幅
        // firstBaselineAnchorとlastBaselineAnchorは詳細不明

        //UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 110))
        // ↓
        viewTop.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0).isActive = true
        viewTop.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0).isActive = true
        viewTop.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        viewTop.heightAnchor.constraint(equalToConstant: 110.0).isActive = true
        
        // txt.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 30, width: 300, height:30)
        // ↓ 完ぺきに同義ではないが、大体のニュアンスをあわせておく
        // ** 重要！コンポーネントとして親子関係がある場合、子は親からの相対的位置を指定しないとダメっぽい。
        txt.leadingAnchor.constraint(equalTo:viewTop.leadingAnchor, constant: self.view.frame.width * 0.05).isActive = true
        txt.trailingAnchor.constraint(equalTo:viewTop.trailingAnchor, constant: self.view.frame.width * -0.05).isActive = true
        txt.topAnchor.constraint(equalTo:viewTop.topAnchor, constant: 30).isActive = true
        txt.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // btn.frame = CGRect(x: self.view.frame.width / 2 - 150, y: 70, width: 120, height:30)
        // ↓ 完ぺきに同義ではないが、大体のニュアンスをあわせておく
        btn.leadingAnchor.constraint(equalTo:txt.leadingAnchor).isActive = true
        btn.topAnchor.constraint(equalTo:txt.bottomAnchor, constant: 10).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.widthAnchor.constraint(equalToConstant:120).isActive = true
        
        // viewBottom.frame = CGRect(x: 0, y: 110, width: self.view.frame.width, height: self.view.frame.height - 110)
        viewBottom.topAnchor.constraint(equalTo:viewTop.bottomAnchor).isActive = true
        viewBottom.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0).isActive = true
        viewBottom.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0).isActive = true
        viewBottom.heightAnchor.constraint(equalToConstant: self.view.frame.height - 110).isActive = true
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
