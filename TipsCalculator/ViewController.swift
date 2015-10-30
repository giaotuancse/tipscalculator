//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Giao Tuan on 10/28/15.
//  Copyright (c) 2015 LiFish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var minimumTip: Int = 0;
    var maximumTip: Int = 100;
    var defaulTip: Int = 0;
    @IBOutlet weak var resultView: UIView!
    @IBOutlet var viewBottom: UIView!
    @IBOutlet weak var tvMoneyValue: UITextField!
    @IBOutlet weak var tvTipValue: UITextView!
    @IBOutlet weak var tvTotalValue: UITextView!
    @IBOutlet weak var tvDivide1Value: UITextView!
    @IBOutlet weak var tvDivide2Value: UITextView!
    @IBOutlet weak var tvDivide3Value: UITextView!
    @IBOutlet weak var tvDivide4Value: UITextView!
    @IBOutlet weak var tvDivide5Value: UITextView!
    @IBOutlet weak var slTip: UISlider!
    @IBAction func onSettingClick(sender: AnyObject) {
        println("Setting click");
        //let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SettingControler") as! SettingControler;
        //self.navigationController!.pushViewController(secondViewController, animated: true);
        let SettingController = self.storyboard?.instantiateViewControllerWithIdentifier("SettingControler") as! SettingControler
        
        self.navigationController!.pushViewController(SettingController, animated: true);
         }
 
    @IBAction func onTapOutside(sender: AnyObject) {
        view.endEditing(true);
    }
  
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBAction func onMoneyValueChage(sender: AnyObject) {
        if (resultView.hidden == true) {
            resultView.hidden = false;
            self.resultView.transform = CGAffineTransformMakeScale(0.0, 0.0);
            UIView.animateWithDuration(1, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.resultView.transform = CGAffineTransformMakeScale(1, 1)
                }, completion: nil);

        }
       
        var percent: Double = Double (slTip.value) * 0.01;
        var tip: Double = (tvMoneyValue.text! as NSString).doubleValue * percent;
        var percentInt: Int = Int (slTip.value);
        tvTipValue.text = "\(percentInt)%"
        var total = tip + (tvMoneyValue.text! as NSString).doubleValue;
        tvTotalValue.text = String(format: "$%.2f",total);
        tvDivide1Value.text = String(format: "$%.2f",total);
        tvDivide2Value.text = String(format: "$%.2f",total/2);
        tvDivide3Value.text = String(format: "$%.2f",total/3);
        tvDivide4Value.text = String(format: "$%.2f",total/4);
        tvDivide5Value.text = String(format: "$%.2f",total/5);
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        var defaults = NSUserDefaults.standardUserDefaults()
        minimumTip = defaults.integerForKey("minimumTip")
        maximumTip = defaults.integerForKey("maximumTip")
        if (maximumTip == 0) {
            maximumTip = 100;
        }
        defaulTip = defaults.integerForKey("defaulTip");
        tvTipValue.text = "\(defaulTip)%"
        
        slTip.maximumValue = Float (maximumTip);
        slTip.minimumValue = Float (minimumTip);
        slTip.value = Float (defaulTip);

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColorFromRGB("F77A74");
        navigationController?.navigationBar.tintColor = UIColor.whiteColor();
        navigationController?.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.whiteColor()];
        println("ON DID LOAD AGAIN");
        
        tvMoneyValue.becomeFirstResponder();
               // slTip.minimumValue = minimumTip;
       // slTip.value = defaulTip;
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
    }

    func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
        var scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}

