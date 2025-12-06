//
//  WeekData.swift
//  HorizontarBarChartTutorial
//
//  Created by Nguyễn Văn Thuận on 6/12/25.
//

import Foundation
struct WeekData: Identifiable{
    var id = UUID()
    var weekDay: String
    var sales: Double
}
var weekSales : [WeekData] = [
    WeekData(weekDay: "Mon", sales: randomNumber()),
    WeekData(weekDay: "Tue", sales: randomNumber()),
    WeekData(weekDay: "Wed", sales: randomNumber()),
    WeekData(weekDay: "Thur", sales: randomNumber()),
    WeekData(weekDay: "Fir", sales: randomNumber()),
    WeekData(weekDay: "Sat", sales: randomNumber()),
    WeekData(weekDay: "Sun", sales: randomNumber())
]

func largestSales() -> Double{
    var largest = 0.0
    for weekData in weekSales{
        if weekData.sales > largest{
            largest = weekData.sales
        }
    }
    return largest
}



func randomNumber() -> Double{
    return Double.random(in: 0...4000)
}
