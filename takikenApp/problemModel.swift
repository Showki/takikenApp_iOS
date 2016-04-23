//
//  problemModel.swift
//  takikenApp
//
//  Created by Nicdang on 2016/04/13.
//  Copyright © 2016年 fksk. All rights reserved.
//
import Foundation
import UIKit

class problemModel {
    
    let api = accessToApi()
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func index(params: String) -> NSMutableDictionary {
        return api.index("Problems", param: params)
    }
    
    func add(params:String) -> NSMutableDictionary {
        return api.add("Problems", params: params)
    }
    
    func setUpAnswer(params: String) {
        let apiResponse = self.index(params)
        // *** 解答する問題通し番号・正解数・問題データの初期化 ***
        appDelegate.answerProblemNumber = 0
        appDelegate.correctCount = 0
        appDelegate.problems = NSMutableArray()
        
        // *** respons内の問題情報を保存 ***
        let problemMax:NSInteger = apiResponse["response"]!["Problems"]!!.count
//        for var i = 0; i < problemMax; ++i {
//            _appDelegate.problems[i] = apiResponse["response"]!["Problems"]!![i]
//        }
        for i in 0 ..< problemMax {
            appDelegate.problems[i] = apiResponse["response"]!["Problems"]!![i]
        }
    
    }
    
    func insertCreateProblem(inputParams: Array<String>) -> NSMutableDictionary {
        let defaultParams = "kentei_id=1&user_id=1&public_flag=0&"
        let postParams = defaultParams + inputParams.joinWithSeparator("&")
        let response: NSMutableDictionary = self.add(postParams)
        return response
    }
    
}