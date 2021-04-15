//
//  ViewController.swift
//  PHLayoutView
//
//  Created by NFDGIT on 04/15/2021.
//  Copyright (c) 2021 NFDGIT. All rights reserved.
//

import UIKit
import PHLayoutView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layoutView1 : PHLayoutView = PHLayoutView.init()
        layoutView1.backgroundColor = UIColor.red
        layoutView1.layout.column = 1
        self.view.addSubview(layoutView1)
        layoutView1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        layoutView1.numberOfCell = {
            return 2
        }
        layoutView1.cellForIndex = {(index)in
            
            let btn : UIButton = UIButton.init()
            btn.backgroundColor = UIColor.green
            btn.setTitleColor(UIColor.red, for: .normal)
            btn.setTitle("penghui", for: .normal)
            btn.snp.makeConstraints { (make) in
                make.height.equalTo(50)
            }
            return btn
            
        }
        layoutView1.reload()
        
        
        
        let layoutView : PHLayoutView = PHLayoutView.init()
        layoutView.backgroundColor = UIColor.red
        layoutView.layout.column = 4
        self.view.addSubview(layoutView)
        layoutView.snp.makeConstraints { (make) in
            make.top.equalTo(layoutView1.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        layoutView.numberOfCell = {
            return 5
        }
        layoutView.cellForIndex = {(index)in
            let btn : UIButton = UIButton.init()
            btn.backgroundColor = UIColor.green
            btn.setTitleColor(UIColor.red, for: .normal)
            btn.setTitle("penghui", for: .normal)
            btn.snp.makeConstraints { (make) in
                make.height.equalTo(50)
            }
            return btn
            
        }
        layoutView.reload()
        
        
        let layoutView3 : PHLayoutView = PHLayoutView.init()
        layoutView3.backgroundColor = UIColor.red
        layoutView3.layout.column = 0
        self.view.addSubview(layoutView3)
        layoutView3.snp.makeConstraints { (make) in
            make.top.equalTo(layoutView.snp.bottom).offset(10)
            make.left.equalToSuperview()
        }
        layoutView3.numberOfCell = {
            return 2
        }
        layoutView3.cellForIndex = {(index)in
            let btn : UIButton = UIButton.init()
            btn.setTitleColor(UIColor.red, for: .normal)
//            btn.setTitle("penghui", for: .normal)
            btn.snp.makeConstraints { (make) in
//                make.height.equalTo(50)
//                make.width.equalTo(100)
            }
            
            let btnContent : UIButton = UIButton.init()
            btn.addSubview(btnContent)
            btnContent.setTitle(index % 2 == 1 ? "fdsafdf" : "fdsafdsafds", for: .normal)
            btnContent.backgroundColor = UIColor.green
            btnContent.snp.makeConstraints { (make) in
                make.left.top.equalTo(5)
                make.bottom.right.equalToSuperview().offset(-5)
            }
            
            
            return btn
        }
        layoutView3.reload()
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

