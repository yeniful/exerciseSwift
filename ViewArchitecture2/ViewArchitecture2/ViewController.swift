//
//  ViewController.swift
//  ViewArchitecture2
//
//  Created by Yeni Hwang on 2021/06/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // create a subView
        let frame = CGRect(x: 60, y: 100, width: 240, height: 120)
        let subView = UIView(frame: frame)
    
        // color of subView
        subView.backgroundColor = UIColor.green
        
        // add a subView
        view.addSubview(subView)
            
        // delete a subView
//        subView.removeFromSuperview()
    }


}

