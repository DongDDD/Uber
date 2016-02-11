//
//  GuidePage.swift
//  Uber
//
//  Created by jobs on 16/1/29.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: FxBaseController {
 
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    var location:FxLocation!
    override func viewDidLoad() {
     super.viewDidLoad()
     self.initPlayVideo()
     self.doAnimation()
      
        
    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func doAnimation()
    {
        var images:[UIImage]=[]
        var image:UIImage?
        var imageName:String?
        //欢迎界面动画
        for var index=0; index<=67; index++ {
            imageName = "logo-" + String(index)
            image = UIImage(named: imageName!)
            images.insert(image!, atIndex: index)
            
        }
        backImageView?.animationImages = images
        backImageView?.animationRepeatCount = 1
        backImageView?.animationDuration = 5
        backImageView?.startAnimating()
        UIView.animateWithDuration(0.7, delay: 5, options: .CurveEaseOut, animations: { () -> Void in

            self.backView?.alpha = 1
            
            self.player?.play()
            }, completion: {
                finished in
                print ( "Animation End" )
        })
        
    }
    func initPlayVideo(){
        //初始化播放器
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.backView!.bounds
        //让视频等比例缩放
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
   
        self.backView.layer.insertSublayer(playerLayer, atIndex: 0)
        self.backView.alpha = 0.0
        
 
       
        NSNotificationCenter.defaultCenter().addObserver ( self,
            selector: "didFinishVideo:" ,
            name: AVPlayerItemDidPlayToEndTimeNotification ,
            object: playerItem)
    }
    func didFinishVideo(sender: NSNotification)
    {
        let item = sender.object as! AVPlayerItem
        
        item.seekToTime(kCMTimeZero)
        self.player.play()
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        self.location = FxLocation()
        self.location.startLocation()
    }
    
    @IBAction func doRegister() {
//        showIndicator("验证", autoHide: false, afterDelay: false)
        let page = UIStoryboard(name:"CreateCountPage", bundle: nil).instantiateViewControllerWithIdentifier("CA")
        
        let navPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(navPage, animated: true, completion: nil)
        
        
    }
    
    

    

}
