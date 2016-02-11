//
//  UserInfoPage.swift
//  Uber
//
//  Created by jobs on 16/2/10.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

class UserInfoPage: FxbasePage,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var backUserView: UIView!
    @IBOutlet weak var backview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "   建立基本资料"
        
        self.backview.layer.masksToBounds = true
        self.backview.layer.cornerRadius = 5
        
        self.backUserView.layer.masksToBounds = true
        self.backUserView.layer.cornerRadius = 5
        
        setNavigationItem("back.png", selector: "doBack", isRight: false)
        setNavigationItem("下一步", selector: "doRight", isRight: true)

        
    }
    
  
    
    @IBAction func doSetAvatar(sender: UIButton) {
        
        let page = UIImagePickerController()
        //手机相册的接口设置
        page.sourceType = .PhotoLibrary
        page.delegate = self
        
        self.presentViewController(page, animated:true, completion: nil)
    }
    override func doRight() {
        let page = UIStoryboard(name: "AddPayPage", bundle: nil).instantiateViewControllerWithIdentifier("AP")
        
        let NavPage = UINavigationController(rootViewController: page)
        self.presentViewController(NavPage, animated: true, completion: nil)

        
        
        
    }
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingImage image: UIImage,
        editingInfo: [String : AnyObject]?) {
            self.avatar.image = image
            picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
