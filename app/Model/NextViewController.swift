//
//  NextViewController.swift
//  app
//
//  Created by Keita Munekawa on 2020/07/19.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit
import Charts

class NextViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    var label = String()
    var question = QuestionBrain()
    
    var count2 = 0
    var overseasStocks = 0
    var japaneseStocks = 0
    var bonds = 0
    var REIT = 0
    var doll = 0
    
    @IBOutlet var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate()
        print(count2)
         self.chartView.centerText = "ポートフォリオ"// グラフに表示するデータのタイトルと値
             let dataEntries = [
                PieChartDataEntry(value: Double(overseasStocks), label: "海外株式"),
                 PieChartDataEntry(value: Double(japaneseStocks), label: "日本株式"),
                 PieChartDataEntry(value: Double(bonds), label: "国債・預金等"),
                 PieChartDataEntry(value: Double(REIT), label: "REIT"),
                 PieChartDataEntry(value: Double(doll), label: "ドル資産"),
                
             ]
             
        let dataSet = PieChartDataSet(entries: dataEntries, label: "参考ポートフォリオ")

             // グラフの色
             dataSet.colors = ChartColorTemplates.vordiplom()
             // グラフのデータの値の色
             dataSet.valueTextColor = UIColor.black
             // グラフのデータのタイトルの色
             dataSet.entryLabelColor = UIColor.black

             self.chartView.data = PieChartData(dataSet: dataSet)
             
             // データを％表示にする
             let formatter = NumberFormatter()
             formatter.numberStyle = .percent
             formatter.maximumFractionDigits = 2
             formatter.multiplier = 1.0
             self.chartView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
             self.chartView.usePercentValuesEnabled = true
             
             view.addSubview(self.chartView)
        question.riskTolerance = 0
        
    }
    
    //リスク許容度を測ってタイプを診断。ポートフォリオの資産の値を確定。
func calculate(){
    if count2 < 5 {
        resultLabel.text = "超堅実タイプ"
        descriptionLabel.text = "リスクは最も低いが、リターンは最も少ない。"
        bonds = 90
        japaneseStocks = 10
        
    }
    else if count2 < 9 {
        resultLabel.text = "堅実タイプ"
        descriptionLabel.text = "リスクを抑えながらも少しずつ資産を増やす。"
        bonds = 75
        overseasStocks = 10
        japaneseStocks = 10
        REIT = 5
    }
    else if count2 < 13 {
        resultLabel.text = "やや堅実タイプ"
        descriptionLabel.text = ""
        bonds = 50
        overseasStocks = 20
        japaneseStocks = 10
        REIT = 10
        doll = 10
    }
    else if count2 < 17 {
        resultLabel.text = "バランス運用タイプ"
        bonds = 30
        overseasStocks = 25
        japaneseStocks = 20
        REIT = 15
        doll = 10
        
    }
    else if count2 < 20 {
        resultLabel.text = "やや積極タイプ"
        bonds = 25
        overseasStocks = 30
        japaneseStocks = 20
        REIT = 15
        doll = 10
    }
    else if count2 < 22{
        resultLabel.text = "積極タイプ"
        bonds = 10
        overseasStocks = 35
        japaneseStocks = 25
        REIT = 15
        doll = 15
    }else{
        resultLabel.text = "超積極タイプ"
        overseasStocks = 45
        japaneseStocks = 25
        REIT = 15
        doll = 15
    }
       }
    }
