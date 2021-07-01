//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by Yeni Hwang on 2021/07/01.
//

import UIKit

class SecondViewController: UIViewController {

    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.textLabel.text = self.textToSet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
