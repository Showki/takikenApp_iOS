//
//  problemModel.swift
//  takikenApp
//
//  Created by Nicdang on 2016/04/13.
//  Copyright © 2016年 fksk. All rights reserved.
//
import Foundation
import UIKit

class categoryModel {
    let api = accessToApi()
//    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    func index(params: String) -> NSMutableDictionary {
        return api.index("Categories", param: params)
    }
}