//
//  ViewController.swift
//  Sample_Charts
//
//  Created by srinivas on 27/12/17.
//  Copyright © 2017 srinivas. All rights reserved.
//

import UIKit
import Charts
  class ViewController: UIViewController {
 
    @IBOutlet weak var barChartView: BarChartView!
     var days: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.noDataText=" no ma "
        days = ["monday","tuesday","wed","thur","fri","sat","sun"]
        
        let tasks : [Double]  = [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0]
        
         setChart(datePoints: days, values: tasks)
        
    }
    func setChart(datePoints: [String], values: [Double])  {
        
        var dataEntries: [BarChartDataEntry] = []
        
        var counter = 0.0
        
        for x in 0..<datePoints.count {
            
            counter += 1.0
            
            let dataentry = BarChartDataEntry(x: values[x],y: counter)
            
            dataEntries.append(dataentry)
            
        }
        
        let chartdataset = BarChartDataSet(values: dataEntries , label: "Days")
        
        let chartData = BarChartData()
        
        chartData.addDataSet(chartdataset)
        
        barChartView.data = chartData
        
         chartdataset.colors = ChartColorTemplates.colorful()
        
         barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        //barChartView.animate(xAxisDuration: 2.0)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

