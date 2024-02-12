//
//  GlucoseChart.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/10/24.
//

import SwiftUI
import Charts

struct GlucoseChartView: View {
    @ObservedObject var glucoseModel: GlucoseModel
    @Binding var highAlert: Int
    @Binding var lowAlert: Int
    var fullSize: Bool
    
    var body: some View {
        let glucoseReadings = fullSize ? glucoseModel.glucoseReadings :  Array(glucoseModel.glucoseReadings.prefix(12))
        let timeLabels = fullSize ? glucoseModel.timeLabels: Array(glucoseModel.timeLabels.prefix(12))
        
        // Scale chart if value outside of bounds
        var chartMax: Int{
            if let maxReading = glucoseReadings.max(){
                return max(maxReading, 200)
            }
            return 200
        }
        var chartMin: Int{
            if let minReading = glucoseReadings.min(){
                return min(minReading, 50)
            }
            return 50
        }
    
        GeometryReader{geometry in
            // 3-hour Chart
            Chart {
                // High Value - Solid Fill
                RectangleMark(
                    xStart: nil,
                    xEnd: nil,
                    yStart: .value("Reading", highAlert),
                    yEnd: .value("Reading", chartMax)
                )
                .foregroundStyle(Color.yellow.opacity(0.2))
                
                // Regular Fill
                RectangleMark(
                    xStart: nil,
                    xEnd: nil,
                    yStart: .value("Reading", lowAlert),
                    yEnd: .value("Reading", highAlert)
                )
                .foregroundStyle(Color.gray.opacity(0.1))
                
                // Low Value - Solid Fill
                RectangleMark(
                    xStart: nil,
                    xEnd: nil,
                    yStart: .value("Reading", chartMin),
                    yEnd: .value("Reading", lowAlert)
                )
                .foregroundStyle(Color.red.opacity(0.2))
                
                // Points from array
                ForEach(glucoseReadings.indices, id: \.self) { index in
                    PointMark(
                        x:.value("Time",timeLabels[index]),
                        y:.value("Reading", glucoseReadings[index])
                    ).foregroundStyle(Color.black).symbolSize(geometry.size.width/20)
                }
                
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .minute, count: 1)) { value in
                    if let date = value.as(Date.self) {
                        let minute = Calendar.current.component(.minute, from: date)
                        switch minute{
                            // Add grid lines on half hours
                        case 0,30:
                            AxisValueLabel{
                                VStack {
                                    Text(date, format: .dateTime.hour().minute())
                                }
                            }
                            AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                            AxisTick()
                        default:
                            AxisValueLabel{
                            }
                        }
                    }
                }
            }
            .chartYAxis{
                AxisMarks(values: [lowAlert,highAlert])
            }
            .chartYScale(domain: chartMin...chartMax)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .padding()
        }
    }
}
