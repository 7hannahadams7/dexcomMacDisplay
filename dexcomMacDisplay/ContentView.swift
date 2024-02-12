//
//  ContentView.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/9/24.
//

// ContentView.swift

import SwiftUI
import Charts

struct ContentView: View {
    @ObservedObject var glucoseModel: GlucoseModel
    @Binding var highAlert: Int
    @Binding var lowAlert: Int

    var body: some View {
        // Pull glucoseModel values
        let glucoseValue = glucoseModel.glucoseValue
        let trendArrow = glucoseModel.trendArrow
        let glucoseReadings = glucoseModel.glucoseReadings
        let timeLabels = glucoseModel.timeLabels
        
        // Set background color based on current value
        var backgroundColor: Color{
            if glucoseValue > highAlert{
                return Color.yellow
            }else if glucoseValue < lowAlert{
                return Color.red
            }else{
                return Color.gray
            }
        }
        
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
            VStack {
                if glucoseModel.validLogin{
                    // Main Text
                    HStack {
                        Text("\(glucoseValue) mg/dL")
                            .font(.title)
                        Text(trendArrow)
                            .font(.title)
                    }
                    .padding()
                    
                    
                    if geometry.size.width > 200 && geometry.size.height > 200 {
                        
                        GlucoseChartView(glucoseModel: glucoseModel, highAlert: $highAlert, lowAlert: $lowAlert, fullSize: true)
                        
                        Button("Refresh") {
                            glucoseModel.fetchGlucoseData()
                        }
                        .padding()
                    }
                }else{
                    VStack{
                        Text("Invalid Inputs").bold()
                        Text("Check credentials.json and PythonConfig.swift inputs")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                // Initial data fetch on app launch
                glucoseModel.fetchGlucoseData()
                // Set up a timer to refresh every 5 minutes
                Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { _ in
                    glucoseModel.fetchGlucoseData()
                }
            }
        }.background(backgroundColor.opacity(0.3))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(glucoseModel: GlucoseModel(), highAlert:.constant(160), lowAlert: .constant(75))
    }
}
