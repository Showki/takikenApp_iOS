//
//  selectCategoryController.swift
//  takikenApp
//
//  Created by Nicdang on 2016/04/13.
//  Copyright © 2016年 fksk. All rights reserved.
//

import UIKit
import SwiftyJSON

class answerCategoriesViewController: UIViewController, UIPickerViewDelegate,UIToolbarDelegate,NSURLSessionDelegate,NSURLSessionDataDelegate, PopUpPickerViewDelegate {
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let _categoryModel: categoryModel = categoryModel()
    let params :String? = "kentei_id=1"
    var categories :NSMutableDictionary?
    
    var category = ["滝沢のなりたち・概要","自然", "施設", "神社・仏閣", "伝統・文化", "都市整備", "交通", "人物", "イベント", "産業", "生涯学習", "メディア"]
    let _problemModel: problemModel = problemModel()
    var picker: PopUpPickerView! = PopUpPickerView()
    
    @IBOutlet weak var selectCategory: UIButton!
    @IBAction func selectCategory(sender: AnyObject) {
        picker.showPicker()
    }
    
//    @IBAction func chellengeProbrem(sender: AnyObject) {
//        let params:String = "kentei_id=1&employ=2012&grade=3&public_flag=1&category_id=1&item=5"
////         *** リザルト画面で問題を再取得するため，カテcategories!["response"]!["Categories"]!![row]["category"]!!["name"]ゴリ指定問題が対象であることを保存 ***
//        appDelegate.answerProblemType = "category"
//        _problemModel.setUpAnswer(params)
//        self.performSegueWithIdentifier("nextAnswer", sender: self)
//    }
//    
    
    @IBAction func chellengeProbrem(sender: AnyObject) {
        let params:String = "kentei_id=1&employ=2012&grade=3&public_flag=1&category_id=1&item=5"
        //         *** リザルト画面で問題を再取得するため，カテゴリ指定問題が対象であることを保存 ***
        appDelegate.answerProblemType = "category"
        _problemModel.setUpAnswer(params)
        self.performSegueWithIdentifier("nextAnswer", sender: self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // *** PopUpPickerViewを利用するためのデリゲートの設定とaddSubview ***
        picker.delegate = self
        self.view.addSubview(picker)
        categories = _categoryModel.index(params!)
        let categories_json = JSON(categories!)
        print("*****************************************************")
        print(categories_json["response"]["Categories"][2]["Category"]["name"])
        print("*****************************************************")
        //        print(categories!["response"]!["Categories"]!!.count)
//        let test = categories!["response"]!["Categories"]!!["3"]!!["category"]!!["name"]!!
//        print(test)
//        let _categoryModel: categoryModel = categoryModel()
//        let params :String? = "kentei_id=1"
//        let _categories = _categoryModel.index(params!)
//        print(_categories)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
//        return category.count
        let categories_json = JSON(categories!)
        return categories_json["response"]["Categories"].count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return category[row]
        let categories_json = JSON(categories!)
        let categoryName:String = String(categories_json["response"]["Categories"][row]["Category"]["name"])
        return categoryName
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let categories_json = JSON(categories!)
        let categoryName:String = String(categories_json["response"]["Categories"][row]["Category"]["name"])
        
        
//        selectCategory.setTitle("\(category[row])▼", forState: .Normal)
        selectCategory.setTitle("\(categoryName)▼", forState: .Normal)
        selectCategory.titleLabel?.adjustsFontSizeToFitWidth = true
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
