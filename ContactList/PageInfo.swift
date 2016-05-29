//
//  PageInfo.swift
//  ContactList
//
//  Created by student on 5/28/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class PageInfo: UIViewController {
    
    var contactDetail: Array<String> = []

    @IBOutlet weak var PageName: UILabel!
    @IBOutlet weak var PagePhone: UILabel!
    @IBOutlet weak var PageAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMyValues()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMyValues(){
        PageName.text = contactDetail[0]
        PageAddress.text = contactDetail[1]
        PagePhone.text = contactDetail[2]
 
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
