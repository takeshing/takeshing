//
//  1ViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/08.
//

import UIKit

class FViewController:UIViewController,UITextFieldDelegate,UIScrollViewDelegate{
    // 変数宣言
    var scroll:UIScrollView!
    var lab:UILabel!
    var txt:UITextField!
    var dic:Dictionary<UITextField, UILabel>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // scroll
        scroll = UIScrollView()
        scroll.backgroundColor = UIColor.white
        scroll.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        scroll.center = self.view.center
        scroll.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        scroll.bounces = false
        scroll.indicatorStyle = UIScrollViewIndicatorStyle.black
        scroll.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        scroll.delegate = self
 
        dic = Dictionary<UITextField, UILabel>()
        for i in 1 ..< 17 {
                lab = UILabel()
                lab.frame = CGRect(x: self.view.frame.width / 2 - 150, y: CGFloat(60 * i - 25), width: 100, height:20)
                lab.text = " ラベル　\(i) "
                lab.textAlignment = NSTextAlignment.center    // アラインメント
                lab.layer.masksToBounds = true
                lab.layer.cornerRadius = 10
                lab.backgroundColor = UIColor.black
                lab.textColor = UIColor.white
                scroll.addSubview(lab)

                txt = UITextField()
                txt.frame = CGRect(x: self.view.frame.width / 2 - 150, y: CGFloat(60 * i), width: 300, height:30)
                txt.borderStyle = UITextBorderStyle.roundedRect  // ボーダー
                txt.returnKeyType = UIReturnKeyType.done   // Enterキーの」実効タイプ
                txt.placeholder = "サンダー元気党入力フォーム \(i) "   // プレースホルダー
                txt.delegate = self
                scroll.addSubview(txt)
                dic.updateValue(lab, forKey: txt)
        }
        
        // オブジェクトの追加
        self.view = scroll
        
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
        let la:UILabel = dic[textField]!
        la.text = textField.text
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
extension UIScrollView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesMoved(touches, with: event)
        print("touchesMoved")
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
        print("touchesEnded")
    }
}
