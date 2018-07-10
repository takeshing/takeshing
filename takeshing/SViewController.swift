//
//  2ViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/08.
//

import UIKit

class SViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var picker = UIPickerView()
    let array: [String] = ["綾野智章","あやのともあき","アヤノトモアキ","ayanotomoaki"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(1, inComponent: 0, animated: true)
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(picker)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let lab = UILabel()
        lab.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 50, width: 200, height: 30)
        lab.textAlignment = .center
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        lab.backgroundColor = UIColor.orange
        lab.textColor = UIColor.white
        
        lab.text = array[row]
        
        return lab
    }
}
