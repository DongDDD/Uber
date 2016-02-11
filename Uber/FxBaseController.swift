//
//  FxBaseController.swift
//  Uber
//
//  Created by jobs on 16/1/29.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

class FxBaseController: UIViewController {
    var activity:FxActivity?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    private func showActivityInView(view: UIView) ->FxActivity
    {
        let activity = FxActivityIndicator(view: view)
        
         activity.frame = view.bounds
         activity.labelText = ""
        view.addSubview(activity)
        
        return activity
    }
    
    func showIndicator(tipMessage:String?,autoHide:Bool, afterDelay:Bool)
    {
        if activity == nil{
            activity = showActivityInView(self.view)
        }
        
        if tipMessage != nil {
            activity?.labelText = tipMessage
            activity?.show(false)
        }
        
        if autoHide && activity?.alpha>=1.0{
            if afterDelay{
                activity?.hide(true, afterDelay: 1.0)
            }
            else{
                activity?.hide(true)
            }
        }
    }
    func hideIndicator()
    {
        activity?.hide(true)
    }
    
    
    
    
    
    

    }
