//
//  AddPayPage.swift
//  Uber
//
//  Created by jobs on 16/2/11.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

class AddPayPage: FxbasePage,UITableViewDelegate,UITableViewDataSource{

    
     
    @IBOutlet weak var tableView: UITableView!
    //定义一个PayInfo类型的数组
    var datas:[PayInfo]!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "添加付款方式"
        setNavigationItem("返回", selector: "doBack", isRight: false)
        setNavigationItem("验证", selector: "doVerifyPhone", isRight: true)
        
        self.initDatas()
        //创建一个重用的单元格
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellID1")
        
        self.tableView.reloadData()
    }
    
    
    
    
    func initDatas()
    {
        var data:PayInfo!
        let dict:[String:String] = [
            "百度钱包" : "BaiDuWallet",
            "银联" : "YinLian",
            "支付宝" : "AliPay",
            "国际信用卡" : "CreditCard"]
        
        datas = []
        for (key,value) in dict {
            data = PayInfo()
            
            data.name = key
            data.icon = value
            
            datas?.append(data)
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        cell.selectedBackgroundView?.backgroundColor=UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        let identify:String = "CellID1"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
            as UITableViewCell
        
        let data = datas[indexPath.row]
        
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = data.name
        cell.imageView?.image = UIImage(named: data.icon)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        let page = YinLianPage()
        self.navigationController?.pushViewController(page, animated: true)
    }
}
    
    

    
    
    
    
    
    
    
 

