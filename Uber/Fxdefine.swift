//
//  Fxdefine.swift
//  Uber
//
//  Created by jobs on 16/1/28.
//  Copyright © 2016年 jobs. All rights reserved.
//

import Foundation

//常量＝》 ObjectC
let LoadingTip="加载中..."
func FxLog(message:String/*,function: String = _FUNCTION_*/)

{
    #if DEBUG
      print("Log:\(message),")
    #else
    
    #endif
}