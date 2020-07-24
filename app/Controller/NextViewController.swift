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
    
    var label = String()
    var question = QuestionBrain()
    
    var count2 = 0
    var overseasStocks = 0
    var japaneseStocks = 0
    var bonds = 0
    var REIT = 0
    var doll = 0
    
    var dataEntries: [PieChartDataEntry] = []
    
    @IBOutlet var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate()
        print(count2)
         self.chartView.centerText = "ポートフォリオ"
        // グラフに表示するデータのタイトルと値
        
        if overseasStocks > 0 {
            dataEntries.append(PieChartDataEntry(value: Double(overseasStocks), label: "海外株式"))
        }
        
        if japaneseStocks > 0 {
            dataEntries.append(PieChartDataEntry(value: Double(japaneseStocks), label: "日本株式"))
        }
        
        if bonds > 0{
            dataEntries.append(PieChartDataEntry(value: Double(bonds), label: "国債・預金等"))
        }
        
        if REIT > 0{
            dataEntries.append(PieChartDataEntry(value: Double(REIT), label: "REIT"))
        }
        
        if doll > 0{
            dataEntries.append(PieChartDataEntry(value: Double(doll), label: "ドル資産"))
        }
        
             
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
        bonds = 90
        japaneseStocks = 10
        
    }
    else if count2 < 9 {
        resultLabel.text = "堅実タイプ"
        bonds = 65
        overseasStocks = 15
        japaneseStocks = 10
        REIT = 10
    }
    else if count2 < 13 {
        resultLabel.text = "やや堅実タイプ"
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
    @IBAction func button(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
