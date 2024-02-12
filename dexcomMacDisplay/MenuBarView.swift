//
//  MenuBarView.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/10/24.
//

import SwiftUI

struct MenuBarView: View {
    @ObservedObject var glucoseModel: GlucoseModel
    @Binding var highAlert: Int
    @Binding var lowAlert: Int
    
    @State private var isExpanded: Bool = false
    var body: some View {
        // Set background color based on current value
        let glucoseValue = glucoseModel.glucoseValue
        let trendArrow = glucoseModel.trendArrow
        
        var backgroundColor: Color{
            if glucoseValue > highAlert{
                return Color.yellow
            }else if glucoseValue < lowAlert{
                return Color.red
            }else{
                return Color.gray
            }
        }
        
        VStack{
            HStack{
                Spacer()
                VStack{
                    HStack{
                        Text("\(glucoseValue) \(trendArrow)").bold()
                    }
                    Text("mg/dL")
                }
                AlertSettingsView(highAlert:$highAlert, lowAlert:$lowAlert)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0)).padding(5)
                Spacer()
            }
            GlucoseChartView(glucoseModel: glucoseModel, highAlert: $highAlert, lowAlert: $lowAlert, fullSize: false)
        }.frame(width: 250, height:250).background(backgroundColor.opacity(0.3))
    }
}

#Preview {
    MenuBarView(glucoseModel: GlucoseModel(), highAlert:.constant(160), lowAlert: .constant(75))
}
