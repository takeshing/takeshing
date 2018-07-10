//
//  1ViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/08.
//

import UIKit

class FViewController:UIViewController,UITextFieldDelegate{
    // 変数宣言
    var lab:UILabel! = UILabel()
    var txt:UITextField! = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // UILabel
        lab.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 50, width: 200, height: 30)
        lab.backgroundColor = UIColor.lightGray
        lab.text = ""
        lab.textAlignment = NSTextAlignment.center    // アラインメント
        lab.layer.masksToBounds = true
        lab.layer.cornerRadius = 10
        
        // UITextField
        txt.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 15, width: 200, height:30)
        txt.borderStyle = .roundedRect  // ボーダー
        txt.returnKeyType = .done   // Enterキーの」実効タイプ
        txt.placeholder = "サンダー元気党入力フォー"   // プレースホルダー
        txt.delegate = self
        
        // オブジェクトの追加
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(lab)
        self.view.addSubview(txt)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // 完了してテキストフィールドを閉じる
    func textFieldShouldReturn(_ tf:UITextField) -> Bool{
        tf.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //UITextFieldの編集後に処理を行う
    func textFieldDidEndEditing(_ textField: UITextField) {
        lab.text = txt.text
    }
}
