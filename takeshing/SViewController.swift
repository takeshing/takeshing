//
//  2ViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/08.
//

import UIKit

class SViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var picker: UIPickerView = UIPickerView()
    let array: [String] = ["綾野智章","あやのともあき","アヤノトモアキ","ayanotomoaki"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250)
        picker.delegate = self
        picker.dataSource = self
        self.view.addSubview(picker)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row] as String
    }
}
