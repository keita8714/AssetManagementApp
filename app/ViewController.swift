//
//  ViewController.swift
//  資産運用提案アプリ
//
//  Created by Keita Munekawa on 2020/07/19.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    var questionBrain = QuestionBrain()
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choideButton2: UIButton!
   
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func button1(_ sender: Any) {
        move()
        questionBrain.getChoice1RiskTolerance()
        questionBrain.nextQuestion()
        updateUI()
    }
    
    @IBAction func button2(_ sender: Any) {
        move()
        questionBrain.getChoice2RiskTolerance()
        questionBrain.nextQuestion()
        updateUI()
    }
    @IBAction func button3(_ sender: Any) {
        move()
        questionBrain.getChoice3RiskTolerance()
        questionBrain.nextQuestion()
        updateUI()
    }
    @IBAction func button4(_ sender: Any) {
        move()
        questionBrain.getChoice4RiskTolerance()
        questionBrain.nextQuestion()
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = questionBrain.getQuetionTitle()
        choiceButton1.setTitle(questionBrain.getChoice1(), for: .normal)
        choideButton2.setTitle(questionBrain.getChoice2(), for: .normal)
        choiceButton3.setTitle(questionBrain.getChoice3(), for: .normal)
        choiceButton4.setTitle(questionBrain.getChoice4(), for: .normal)
        }
    
    func move(){
        if questionBrain.QuestionNumber == 4{
               performSegue(withIdentifier: "Next", sender: nil)
            questionBrain.QuestionNumber = 0
               }
    }
    }


 


