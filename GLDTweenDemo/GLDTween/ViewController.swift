//
//  ViewController.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/26.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    var box:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        box = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        box.backgroundColor = UIColor.redColor()
        self.view.addSubview(box)
    }
    
    override func viewDidAppear(animated: Bool) {
        var t:CGAffineTransform = CGAffineTransformIdentity
        t = CGAffineTransformRotate(t, 45*3.14/180.0)
        GLDTween.addTween(box,
            ["duration":1,
                "delay":0,
                "easing":GLDEaseTypeInOutExpo,
                "alpha":0.0,
                "center":CGPoint(x:100,y:400),
                "frame":CGRect(x: 200, y: 55, width: 10, height: 200),
                "backgroundColor": UIColor.blackColor(),
                "centerX":300,
                "z":200,
                "transform": t,
                "start":GLDTweenClosure{
                    println("start closure")
                },
                "completion":GLDTweenClosure{
                    println("stop closure")
            }])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
