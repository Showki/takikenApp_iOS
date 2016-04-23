//
//  answerRandomViewController.swift
//  takikenApp
//
//  Created by Nicdang on 2016/04/22.
//  Copyright © 2016年 fksk. All rights reserved.
//

import UIKit

class answerRandomViewController: UIViewController {
    let _appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let _problemModel: problemModel = problemModel()
    @IBAction func challengeProbem(sender: AnyObject) {
        let params:String = "kentei_id=1&public_flag=1&item=5"
        // *** リザルト画面で問題を再取得するため，ランダム問題が対象であることを保存 ***
        _appDelegate.answerProblemType = "random"
        _problemModel.setUpAnswer(params)
        performSegueWithIdentifier("nextAnswer", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
