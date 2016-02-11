//
//  CreateAccountPage.swift
//  Uber
//
//  Created by jobs on 16/2/4.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

class CreateAccountPage: FxbasePage {

    
    @IBOutlet weak var backView: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "创建账户"
        
        setNavigationItem("下一步", selector: "doRight", isRight: true)
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
        
        
       

        
    }

    override func doRight() {
        let page = UIStoryboard(name: "UserInfoPage", bundle: nil).instantiateViewControllerWithIdentifier("UF")
        
        self.navigationController?.pushViewController(page, animated: true)
    }
    @IBAction func doSelectCountry(sender: AnyObject) {
        let page = UIStoryboard.init(name: "selectCountryPage", bundle: nil).instantiateViewControllerWithIdentifier("SC")
        
        let NavPage = UINavigationController(rootViewController: page)
        self.presentViewController(NavPage, animated: true, completion: nil)
        
        
        
        
        
        
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
