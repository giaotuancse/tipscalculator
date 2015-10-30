//
//  SettingControler.swift
//  TipsCalculator
//
//  Created by Giao Tuan on 10/30/15.
//  Copyright (c) 2015 LiFish. All rights reserved.
//
import UIKit


class SettingControler: UITableViewController,UITableViewDelegate {
    
    var minimumTip: Int = 0;
    var maximumTip: Int = 100;
    var defaulTip: Int = 0;
    
    @IBOutlet weak var tvDefault: UITextField!
    @IBOutlet weak var tvMaximum: UITextField!
    @IBOutlet weak var tvMinimum: UITextField!

    @IBAction func TvMinimimDidEnd(sender: UITextField) {
        
        var minimum = sender.text.toInt();
        if (minimum > 9 && minimum < 100) {
            view.endEditing(true)
            if (minimum<maximumTip) {
                var defaults = NSUserDefaults.standardUserDefaults()
                defaults.setInteger(minimum!, forKey: "minimumTip")
                defaults.synchronize()
                 minimumTip = minimum!;
            } else {
                var alert = UIAlertController(title: "Error", message: "Invalid Minimum Percent", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)

                sender.text = "";
            }
        }
        println("\(minimum)");
        
    }
  
    @IBAction func tvDefaulValueChange(sender: UITextField) {
        var defaultValue = sender.text.toInt();
        if (defaultValue > 9 && defaultValue < 100) {
            view.endEditing(true)
            if (defaultValue>minimumTip && defaultValue < maximumTip) {
                var defaults = NSUserDefaults.standardUserDefaults()
                defaults.setInteger(defaultValue!, forKey: "defaulTip")
                defaults.synchronize()
               
            } else {
                var alert = UIAlertController(title: "Error", message: "Invalid Default Percent", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                sender.text = "";
                
            }
        }

    }
    
    @IBAction func tvMaximumValueChange(sender: UITextField) {
        var max = sender.text.toInt();
        if (max > 9 && max < 100) {
            view.endEditing(true)
            if (max>minimumTip) {
                var defaults = NSUserDefaults.standardUserDefaults()
                defaults.setInteger(max!, forKey: "maximumTip")
                defaults.synchronize()
                maximumTip = max!;
            } else {
                var alert = UIAlertController(title: "Error", message: "Invalid Maximum Percent", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                sender.text = "";
            }
        }
        println("\(max)");

    }
 
    @IBAction func onTapOutside(sender: AnyObject) {
        println("TAP OUTSIDE");
        view.endEditing(true);
//        tvDefault.endEditing(true);
//        tvMaximum.endEditing(true);
//        tvMinimum.endEditing(true);
    }
       override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        var defaults = NSUserDefaults.standardUserDefaults()
        minimumTip = defaults.integerForKey("minimumTip")
        maximumTip = defaults.integerForKey("maximumTip")
        if (maximumTip == 0) {
            maximumTip = 100;
        }
        defaulTip = defaults.integerForKey("defaulTip")
        tvMinimum.placeholder = ("\(minimumTip)");
        tvMaximum.placeholder = ("\(maximumTip)");
        tvDefault.placeholder = ("\(defaulTip)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }

    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 50.0;
    }
    
    


}

