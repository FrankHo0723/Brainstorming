//
//  ViewController.swift
//  Brainstorming
//
//  Created by Frank on 2017/12/30.
//  Copyright © 2017年 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIImageView!
    let allQuestion = questionBank()
    var pickAnswer = false
    var questionNum = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionLabel.text = allQuestion.list[0].question
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        if(sender.tag == 1){
            pickAnswer = true
            
        }
        else if(sender.tag == 2){
            pickAnswer = false
        }
        checkAnswer()
        questionNum = questionNum + 1
        nextQuestion()
    }
    
    func updateUI(){
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(questionNum + 1 ) / 5"
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNum + 1)
        
    }
    
    func nextQuestion(){
        if(questionNum <= 4 ) {
            questionLabel.text = allQuestion.list[questionNum].question
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "very good", message:"太好了！再玩一次", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in self.startOver()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startOver(){
        score = 0
        questionNum = 0
        questionLabel.text = allQuestion.list[questionNum].question
        updateUI()
    }
    
    func checkAnswer(){
        if (allQuestion.list[questionNum].answer == pickAnswer){
            score = score + 50
            ProgressHUD.showSuccess("correct")
        }
        else{
            score = score - 20
            ProgressHUD.showError("incorrect")
        }
        
    }

}

