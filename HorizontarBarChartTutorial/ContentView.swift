//
//  ContentView.swift
//  HorizontarBarChartTutorial
//
//  Created by Nguyễn Văn Thuận on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{
            geometry in
            VStack(alignment: .leading, spacing: 0){
                Text("Weekly Sales")
                    .font(.title)
                    .padding()
                let rowHeight = geometry.size.height / CGFloat(weekSales.count)
                let labelWidth = geometry.size.width * 0.09
                let graphWidth = geometry.size.width * 0.6
                let valueWidth = geometry.size.width * 0.18
                ForEach(weekSales){
                    weekData in
                    HStack{
                        Text(weekData.weekDay)
                            .font(.caption)
                            .bold()
                            .frame(maxWidth: labelWidth, maxHeight: .infinity, alignment: .center)
                        let rowWidth = calculaterRowWidth(graphWidth, weekData)
                        Rectangle()
                            .cornerRadius(5)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                            .frame(maxWidth: rowWidth, maxHeight: .infinity, alignment: .leading)
                            .foregroundColor(Color.blue)
                        
                        Text(formatSale(weekData))
                            .font(.caption2)
                            .frame(maxWidth: valueWidth, maxHeight: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal)
                    .frame(maxHeight: rowHeight)
                }
            }
            .padding(.vertical)
        }
    }
    func calculaterRowWidth(_ graphWidth: Double,_ weekData: WeekData) -> Double{
        let size = weekData.sales / largestSales()*graphWidth
        return size.isNaN ? 0.0 : size
    }
    
    func formatSale(_ weekData: WeekData) -> String{
        return String(format: "$%.2f", weekData.sales)
    }
}

#Preview {
    ContentView()
}
