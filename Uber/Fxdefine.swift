//
//  Fxdefine.swift
//  Uber
//
//  Created by jobs on 16/1/28.
//  Copyright © 2016年 jobs. All rights reserved.
//

import Foundation
import UIKit

//常量＝》 ObjectC
let LoadingTip="加载中..."
let iOS8:Float = 8.0
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

func FxLog(message:String/*,function: String = _FUNCTION_*/)

{
    #if DEBUG
      print("Log:\(message),")
    #else
    
    #endif
}