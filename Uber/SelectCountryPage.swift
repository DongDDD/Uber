//
//  SelectCountryPage.swift
//  Uber
//
//  Created by jobs on 16/2/7.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

class SelectCountryPage: FxbasePage,UITableViewDataSource,UITableViewDelegate{
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var countrys:[CountryInfo]?
    
    var headers:[String]?
    var dictDatas:[String:AnyObject]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "选择国家/地区"
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        self.initCountry()
        self.initDatas()
       
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CD")
        self.tableView.reloadData()
        
        
    }
    
    func initCountry()
    {
        let arrCodes = NSLocale.ISOCountryCodes()
        let locale:NSLocale = NSLocale.currentLocale()
        var info:CountryInfo!
        
        countrys = []
        
        for code in arrCodes{
            
            info = CountryInfo()
            info.code = code
            info.name = locale.displayNameForKey(NSLocaleCountryCode, value: code)!
            
            
            countrys?.append(info)
    
        }
        // 排序
        countrys?.sortInPlace({ (arg1:CountryInfo, arg2:CountryInfo) -> Bool in
            return arg1.name.localizedCaseInsensitiveCompare(arg2.name) == .OrderedAscending
        })
        
        
        
    }
    
    func initDatas()
    {
        //第一个字母
        var firstLetter:String!
        //  自己创建的类用来封装国家的数据 （model）
        var datas:[CountryInfo]!
        
        headers = []
        datas = []
        dictDatas = [:]
        
        for counry in countrys!{
        //调用OC的函数 取出国籍第一个字母
            firstLetter = FxString.firstCharactor(counry.name)
            
            if !(headers!.contains(firstLetter)){
                if datas.count > 0 {
                    dictDatas![headers!.last!] = datas
                }
                
                
                headers?.append(firstLetter)
                datas = []
            }
            
            datas.append(counry)
            
            
        }
        //加上最后一个
        dictDatas![headers!.last!] = datas
        
        
    }
    
    //Section个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return headers!.count
    }
   //Section里面的number个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = headers![section]
        let datas = dictDatas![key] as! [CountryInfo]
        
        return datas.count
    }
    
    //
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return headers![section]
    }
    //添加索引
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        var indexs:[String]=[]
        var char: [CChar]=[0,0]
        
        for var i = 65; i < 65+26; i++ {
            char[0] = CChar(i)
            indexs.append(String.fromCString(char)!)
            
        }
        indexs.append("#")
        
        return indexs
    }
    //创建各单元显示内容（创建参数indexPath指定的单元）
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identify:String = "CD"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
            as UITableViewCell
        
        let key = headers![indexPath.section]
        let datas = dictDatas![key] as! [CountryInfo]
        let country = datas[indexPath.row]
        
        cell.accessoryType = .None
        cell.textLabel?.text = country.name!
        
        return cell
    }
    
    //UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell: UITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath)
        
        cell!.accessoryView = UIImageView(image: UIImage(named: "Back.png"))
        
        self.doBack()
        
        
    }
    
    
    override func doBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
 
    
        

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
