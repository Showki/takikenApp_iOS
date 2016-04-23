//
//  answerResultViewController.swift
//  takikenApp
//
//  Created by Nicdang on 2016/04/15.
//  Copyright © 2016年 fksk. All rights reserved.
//

import UIKit

class answerResultViewController: UIViewController {
    var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBAction func nextAction(sender: AnyObject) {
        appDelegate.answerProblemNumber! += 1
        if appDelegate.answerProblemNumber < appDelegate.problems.count {
            performSegueWithIdentifier("nextAnswer", sender: nil)
        }else{
            appDelegate.answerProblemNumber! = 0
            performSegueWithIdentifier("totalResult", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // *** ナビゲーションバーのbackボタンを非表示にする（TODO:ベストな方法に変更） ***
        self.navigationItem.title = ""
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        if isCorrectAnswer() {
            appDelegate.correctCount! += 1
            resultLabel.text = "正解"
//            resultImage.image = UIImage(named: "kusudama.png")
        }else{
            resultLabel.text = "不正解"
//            resultImage.image = UIImage(named: "kaminari.png")
        }
        rightAnswerLabel.text = appDelegate.rightAnswer
        descriptionLabel.text = appDelegate.rightDescription
        print(appDelegate.description)
        
        
        rightAnswerLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }

    func isCorrectAnswer() -> Bool {
        if appDelegate.answer! == appDelegate.rightAnswer! {
            return true
        }
        return false
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
