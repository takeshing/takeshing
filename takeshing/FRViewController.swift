//
//  FRViewController.swift
//  takeshing
//
//  Created by たけしMac on 2018/07/27.
//  Copyright © 2018年 thunder_healthy_political_party. All rights reserved.
//

import UIKit
import AVFoundation

class FRViewController : UIViewController{
    let viewBase: UIView = UIView()
    let viewP:UIImageView = UIImageView()
    let viewS:UIView = UIView()
    let btn1 = UIButton()
    let btn2 = UIButton()
    let btn3 = UIButton()
    let btn4 = UIButton()
    let btn5 = UIButton()
    let btn6 = UIButton()
    let btn7 = UIButton()
    let btn8 = UIButton()
    let tab: UITabBarController = UITabBarController()
    var audiobgm: AVAudioPlayer!
    var audio: AVAudioPlayer!
    var portraitConstaints:[NSLayoutConstraint] = []
    var landscapeConstaints:[NSLayoutConstraint] = []
    var status_height : CGFloat = 0.0
    var tabbar_hieght : CGFloat = 0.0
    var p_height : CGFloat = 0.0
    var s_height : CGFloat = 0.0
    var p_width : CGFloat = 0.0
    var s_width : CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgm = Bundle.main.path(forResource: "bgm", ofType: "mp3")
        do {
            audiobgm = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bgm!))
        } catch {
        }
        audiobgm.play()
        
        let se = Bundle.main.path(forResource: "SE", ofType: "mp3")
        do {
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: se!))
        } catch {
        }
        audio.prepareToPlay()

        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.backgroundColor = UIColor.red
        var img : UIImage! = UIImage()
        img = UIImage(named:"キャラセレ.png")
        viewP.translatesAutoresizingMaskIntoConstraints = false
        viewP.backgroundColor = UIColor.yellow
        viewP.image = img
        viewS.translatesAutoresizingMaskIntoConstraints = false
        viewS.backgroundColor = UIColor.green
        
        btn1.translatesAutoresizingMaskIntoConstraints = false
        btn1.layer.borderWidth = 1
        btn1.layer.borderColor = UIColor.white.cgColor
        btn1.setImage(UIImage.init(named: "arioka.jpg"), for: UIControlState.normal)
        btn1.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)
        
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn2.layer.borderWidth = 1
        btn2.layer.borderColor = UIColor.white.cgColor
        btn2.setImage(UIImage.init(named: "rai.jpg"), for: UIControlState.normal)
        btn2.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)
        
        btn3.translatesAutoresizingMaskIntoConstraints = false
        btn3.layer.borderWidth = 1
        btn3.layer.borderColor = UIColor.white.cgColor
        btn3.setImage(UIImage.init(named: "takeshi.jpg"), for: UIControlState.normal)
        btn3.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)
        
        btn4.translatesAutoresizingMaskIntoConstraints = false
        btn4.layer.borderWidth = 1
        btn4.layer.borderColor = UIColor.white.cgColor
        btn4.setImage(UIImage.init(named: "masaru.jpeg"), for: UIControlState.normal)
        btn4.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)

        btn5.translatesAutoresizingMaskIntoConstraints = false
        btn5.layer.borderWidth = 1
        btn5.layer.borderColor = UIColor.white.cgColor
        btn5.setImage(UIImage.init(named: "マイケル.jpg"), for: UIControlState.normal)
        btn5.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)

        btn6.translatesAutoresizingMaskIntoConstraints = false
        btn6.layer.borderWidth = 1
        btn6.layer.borderColor = UIColor.white.cgColor
        btn6.setImage(UIImage.init(named: "ガンダム.jpeg"), for: UIControlState.normal)
        btn6.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)

        btn7.translatesAutoresizingMaskIntoConstraints = false
        btn7.layer.borderWidth = 1
        btn7.layer.borderColor = UIColor.white.cgColor
        btn7.setImage(UIImage.init(named: "ブルースリー.jpg"), for: UIControlState.normal)
        btn7.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)

        btn8.translatesAutoresizingMaskIntoConstraints = false
        btn8.layer.borderWidth = 1
        btn8.layer.borderColor = UIColor.white.cgColor
        btn8.setImage(UIImage.init(named: "Jobs.jpg"), for: UIControlState.normal)
        btn8.addTarget(self,
                       action: #selector(FRViewController.tapped(sender:)),
                       for: .touchUpInside)

        viewS.addSubview(btn1)
        viewS.addSubview(btn2)
        viewS.addSubview(btn3)
        viewS.addSubview(btn4)
        viewS.addSubview(btn5)
        viewS.addSubview(btn6)
        viewS.addSubview(btn7)
        viewS.addSubview(btn8)


        viewBase.addSubview(viewP)
        viewBase.addSubview(viewS)
        self.view.addSubview(viewBase)
        
        viewBase.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0).isActive = true
        viewBase.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0).isActive = true
        viewBase.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        viewBase.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true

        reloade()
        
    }
    @objc func tapped(sender : AnyObject) {
        let b : UIButton = sender as! UIButton
        audio.currentTime = 0
        audio.play()
        print(b.image(for: UIControlState.normal))
        
    }
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotationChange(notification:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    @objc
    func rotationChange(notification: NSNotification){
        reloade()
    }
    func reloade(){
        status_height = UIApplication.shared.statusBarFrame.size.height
        tabbar_hieght = UITabBarController().tabBar.frame.size.height
        print(status_height)
        print(tabbar_hieght)
        if (self.view.frame.height > self.view.frame.width){
            p_height = (self.view.frame.height - status_height - tabbar_hieght) * 0.65
            s_height = (self.view.frame.height - status_height - tabbar_hieght) * 0.35
            p_width = self.view.frame.width
            s_width = self.view.frame.width
            portraitConstaints = [
                viewP.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0),
                viewP.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0),
                viewP.topAnchor.constraint(equalTo:self.view.topAnchor, constant:status_height),
                viewP.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant: -(s_height + tabbar_hieght)),
                viewS.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0),
                viewS.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0),
                viewS.topAnchor.constraint(equalTo:self.view.topAnchor, constant:status_height + p_height),
                viewS.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant: -tabbar_hieght),
                btn1.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0),
                btn1.topAnchor.constraint(equalTo:viewS.topAnchor, constant: 0),
                btn1.widthAnchor.constraint(equalToConstant: self.view.frame.width / 4),
                btn1.heightAnchor.constraint(equalToConstant: (self.view.frame.height * 0.4 - tab.tabBar.frame.size.height) / 2),
                btn2.leadingAnchor.constraint(equalTo:btn1.trailingAnchor, constant: 0),
                btn2.topAnchor.constraint(equalTo:viewS.topAnchor, constant: 0),
                btn2.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn2.heightAnchor.constraint(equalTo: btn1.heightAnchor),
                btn3.leadingAnchor.constraint(equalTo:btn2.trailingAnchor, constant: 0),
                btn3.topAnchor.constraint(equalTo:viewS.topAnchor, constant: 0),
                btn3.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn3.heightAnchor.constraint(equalTo: btn1.heightAnchor),
                btn4.leadingAnchor.constraint(equalTo:btn3.trailingAnchor, constant: 0),
                btn4.topAnchor.constraint(equalTo:viewS.topAnchor, constant: 0),
                btn4.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn4.heightAnchor.constraint(equalTo: btn1.heightAnchor),
                btn5.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0),
                btn5.topAnchor.constraint(equalTo:btn1.bottomAnchor, constant: 0),
                btn5.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn5.heightAnchor.constraint(equalTo: btn1.heightAnchor),
                btn6.leadingAnchor.constraint(equalTo:btn5.trailingAnchor, constant: 0),
                btn6.topAnchor.constraint(equalTo:btn2.bottomAnchor, constant: 0),
                btn6.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn6.heightAnchor.constraint(equalTo: btn1.heightAnchor),
                btn7.leadingAnchor.constraint(equalTo:btn6.trailingAnchor, constant: 0),
                btn7.topAnchor.constraint(equalTo:btn3.bottomAnchor, constant: 0),
                btn7.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn7.heightAnchor.constraint(equalTo: btn1.heightAnchor),
                btn8.leadingAnchor.constraint(equalTo:btn7.trailingAnchor, constant: 0),
                btn8.topAnchor.constraint(equalTo:btn4.bottomAnchor, constant: 0),
                btn8.widthAnchor.constraint(equalTo: btn1.widthAnchor),
                btn8.heightAnchor.constraint(equalTo: btn1.heightAnchor)
            ]
        } else {
            p_height = self.view.frame.height - status_height - tabbar_hieght
            s_height = self.view.frame.height - status_height - tabbar_hieght
            p_width = self.view.frame.width * 0.7
            s_width = self.view.frame.width * 0.3
            landscapeConstaints = [
                viewP.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0),
                viewP.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: -s_width),
                viewP.topAnchor.constraint(equalTo:self.view.topAnchor, constant:0),
                viewP.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant: -tabbar_hieght),
                viewS.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: p_width),
                viewS.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0),
                viewS.topAnchor.constraint(equalTo:self.view.topAnchor, constant:status_height),
                viewS.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant: -tabbar_hieght),
                btn1.leadingAnchor.constraint(equalTo:viewS.leadingAnchor, constant: 0),
                btn1.topAnchor.constraint(equalTo:viewS.topAnchor, constant: 0),
                btn1.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn1.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn2.leadingAnchor.constraint(equalTo:btn1.trailingAnchor, constant: 0),
                btn2.topAnchor.constraint(equalTo:viewS.topAnchor, constant: 0),
                btn2.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn2.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn3.leadingAnchor.constraint(equalTo:viewS.leadingAnchor, constant: 0),
                btn3.topAnchor.constraint(equalTo:btn1.bottomAnchor, constant: 0),
                btn3.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn3.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn4.leadingAnchor.constraint(equalTo:btn3.trailingAnchor, constant: 0),
                btn4.topAnchor.constraint(equalTo:btn2.bottomAnchor, constant: 0),
                btn4.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn4.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn5.leadingAnchor.constraint(equalTo:viewS.leadingAnchor, constant: 0),
                btn5.topAnchor.constraint(equalTo:btn3.bottomAnchor, constant: 0),
                btn5.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn5.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn6.leadingAnchor.constraint(equalTo:btn5.trailingAnchor, constant: 0),
                btn6.topAnchor.constraint(equalTo:btn4.bottomAnchor, constant: 0),
                btn6.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn6.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn7.leadingAnchor.constraint(equalTo:viewS.leadingAnchor, constant: 0),
                btn7.topAnchor.constraint(equalTo:btn5.bottomAnchor, constant: 0),
                btn7.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn7.heightAnchor.constraint(equalToConstant: s_height / 4),
                btn8.leadingAnchor.constraint(equalTo:btn7.trailingAnchor, constant: 0),
                btn8.topAnchor.constraint(equalTo:btn6.bottomAnchor, constant: 0),
                btn8.widthAnchor.constraint(equalToConstant: s_width / 2),
                btn8.heightAnchor.constraint(equalToConstant: s_height / 4),
            ]
        }

        if (self.view.frame.height > self.view.frame.width){
            portraitConstaints.forEach { (cons) in
                cons.isActive = true
            }
            landscapeConstaints.forEach { (cons) in
                cons.isActive = false
            }
        } else {
            portraitConstaints.forEach { (cons) in
                cons.isActive = false
            }
            landscapeConstaints.forEach { (cons) in
                cons.isActive = true
            }
        }
    }
}
