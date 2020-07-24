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
    var riskTolerance = Int()
    
//リスク許容度を図る質問
    let Quetions = [
        Question(title: "現在の年齢を入力してください。", choice1: "20代", choice2: "30代", choice3: "40代", choice4: "50代以上", choice1RiskTolerance: 5, choice2RiskTolerance: 4, choice3RiskTolerance: 3, choice4RiskTolerance: 2),
        
        Question(title: "次の投資成果のうちイメージに近いものはどれですか。（計100万円を1年間投資した場合）", choice1: "最高103万円 平均102万円 最低101万円", choice2:"最高113万円 平均105万円 最低97万円", choice3: "最高123万円 平均108万円 最低93万円", choice4: "最高140万円 平均112万円 最低85万円", choice1RiskTolerance: 1, choice2RiskTolerance: 2, choice3RiskTolerance: 3, choice4RiskTolerance: 5),
        
        Question(title: "投資に対する知識はどの程度お持ちですか。", choice1: "十分に知識は持っている", choice2: "ある程度持っている", choice3: "ほとんど持っていない", choice4: "持っていない",  choice1RiskTolerance: 5, choice2RiskTolerance: 4, choice3RiskTolerance: 2, choice4RiskTolerance: 1),
        
        Question(title: "投資期間はどのくらいで考えていますか。", choice1: "短期間(1〜4年)", choice2: "中期間(5〜9年)", choice3: "長期間(10年以上)", choice4: "特に決めていない",  choice1RiskTolerance: 1, choice2RiskTolerance: 3, choice3RiskTolerance: 5, choice4RiskTolerance: 3),
        
        Question(title: "保有している金融商品に大きな損失が発生したらどうしますか。", choice1:"さらに損失が拡大することを考え、すぐに売却する" , choice2: "しばらく様子を見た後、損失を抱えたままなら売却する", choice3: "何もせずそのまま保有する", choice4: "今後上昇することを期待して、さらに買い増す",  choice1RiskTolerance: -5, choice2RiskTolerance: 0, choice3RiskTolerance: 3, choice4RiskTolerance: 5)
    
    
    ]
    
    //質問文を画面に出す
    func getQuetionTitle() -> String {
        return Quetions[QuestionNumber].title
    }
    
    //回答をボタンに出力
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
    
    //リスク許容度を計るriskToleranceに選択肢毎のポイントを追加
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
  
    //次の質問文に進む
    mutating func nextQuestion(){
        QuestionNumber += 1
        }
    
    }
