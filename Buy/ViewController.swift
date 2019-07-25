//
//  ViewController.swift
//  Buy
//
//  Created by lawliet on 2019/7/18.
//  Copyright © 2019 lawliet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel! //總價Label
    @IBOutlet var labelCollection: [UILabel]! //Label Array 4個0的Label
    @IBOutlet weak var mySlider: UISlider! // 每月分期的條
    @IBOutlet weak var monthPay: UILabel! // 每月分期多少
    @IBOutlet weak var overMonth: UILabel! //幾月後結清
    
    @IBOutlet var test2: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "0"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func slider(_ sender: Any) { //滑動時顯示每月分期多少
        let monthPayInt = Int(mySlider.value)
        step(monthPayInt: monthPayInt)
        monthPay.text = "\(monthPayInt)"
    }
    
    @IBAction func stepper(_ sender: UIStepper) { //每壓一次 + 或 - 會增加或者減少的數字
        labelCollection[sender.tag].text = "\(Int(sender.value))"
        
        if let goInt = Int(labelCollection[0].text!), let ps4Int = Int(labelCollection[1].text!), let watchInt = Int(labelCollection[2].text!), let ipadInt = Int(labelCollection[3].text!){
            totalLabel.text = "\(5000 * goInt + 1500 * ps4Int + 8900 * watchInt + 28900 * ipadInt)"
        }
        let monthPayInt = Int(mySlider.value)
        step(monthPayInt: monthPayInt)
    }
    
    func step(monthPayInt: Int) { //每按一次會改變幾月後結清的方法
        if let totleInt = Int(totalLabel.text!), totleInt != 0, monthPayInt != 0{
            if monthPayInt % totleInt == 0 {
                overMonth.text = "\(totleInt / monthPayInt)"
            } else {
                overMonth.text = "\((totleInt / monthPayInt) + 1)"
            }
        }
    }
}
