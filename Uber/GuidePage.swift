//
//  GuidePage.swift
//  Uber
//
//  Created by jobs on 16/1/29.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

class GuidePage: FxBaseController {
 
    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.doAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func doAnimation()
    {
        var images:[UIImage]=[]
        var image:UIImage?
        var imageName:String?
        for var index=0; index<=67; index++ {
            imageName = "logo-" + String(index)
            image = UIImage(named: imageName!)
            images.insert(image!, atIndex: index)
            
        }
        backImageView?.animationImages = images
        backImageView?.animationRepeatCount = 1
        backImageView?.animationDuration = 5
        backImageView?.startAnimating()
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
