//
//  QuestionBrain.swift
//  資産運用提案アプリ
//
//  Created by Keita Munekawa on 2020/07/19.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
struct QuestionBrain {
    var QuestionNumber = 0
    var riskTolerance = 0
    let Quetions = [
        Question(title: "現在の年齢を入力してください。", choice1: "20代", choice2: "30代", choice3: "40代", choice4: "50代以上", choice1RiskTolerance: 0, choice2RiskTolerance: 0, choice3RiskTolerance: 0, choice4RiskTolerance: 0),
        
        Question(title: "現在の年収を入力してください。", choice1: "500万円未満", choice2:"500万円以上1000万円未満", choice3: "1000万円以上3000万円未満", choice4: "3000万円以上", choice1RiskTolerance: 0, choice2RiskTolerance: 0, choice3RiskTolerance: 1, choice4RiskTolerance: 2),
        
        Question(title: "現在の金融資産を入力してください。", choice1: "500万円未満", choice2: "500万円以上1000万円未満", choice3: "1000万円以上3000万円未満", choice4: "3000万円以上",  choice1RiskTolerance: 1, choice2RiskTolerance: 2, choice3RiskTolerance: 4, choice4RiskTolerance: 5),
        
        Question(title: "積立期間はどのくらいで考えていますか。", choice1: "短期間(1〜4年)", choice2: "中期間(5〜9年)", choice3: "長期間(10年以上)", choice4: "特に決めていない",  choice1RiskTolerance: 1, choice2RiskTolerance: 3, choice3RiskTolerance: 5, choice4RiskTolerance: 3),
        
        Question(title: "あなたが積立先を選択する場合に次のどの選択肢が最も魅力的だと思いますか。", choice1:"ノーリスク・ノーリターン" , choice2: "ローリスク・ローリターン", choice3: "ミドルリスク・ミドルリターン", choice4: "ハイリスク・ハイリターン",  choice1RiskTolerance: -5, choice2RiskTolerance: 0, choice3RiskTolerance: 3, choice4RiskTolerance: 5)
        
    
    
    ]
    
    func getQuetionTitle() -> String {
        return Quetions[QuestionNumber].title
    }
    
    func getChoice1() -> String{
        return Quetions[QuestionNumber].choice1
    }
    
    func getChoice2() -> String{
        return Quetions[QuestionNumber].choice2
    }
    
    func getChoice3() -> String{
        return Quetions[QuestionNumber].choice3
    }
    
    func getChoice4() -> String{
        return Quetions[QuestionNumber].choice4
    }
    
    mutating func getChoice1RiskTolerance(){
    riskTolerance += Quetions[QuestionNumber].choice1RiskTolerance
    }
    
    mutating func getChoice2RiskTolerance(){
    riskTolerance += Quetions[QuestionNumber].choice2RiskTolerance
       }
    
    mutating func getChoice3RiskTolerance(){
    riskTolerance += Quetions[QuestionNumber].choice3RiskTolerance
       }
    
    mutating func getChoice4RiskTolerance() {
    riskTolerance += Quetions[QuestionNumber].choice4RiskTolerance
       }
  
    
    mutating func nextQuestion(){
        QuestionNumber += 1
        }
        
    }
