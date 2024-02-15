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
    
    @State private var tabExpanded: Bool = false

    var body: some View {
        // Pull glucoseModel values
        let glucoseValue = glucoseModel.glucoseValue
        let trendArrow = glucoseModel.trendArrow
        
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
        
        GeometryReader{geometry in
            ZStack(alignment:.topTrailing){
                VStack {
                    if glucoseModel.validLogin{
                        // Main Text
                        HStack{
                            Spacer()
                            VStack{
                                HStack{
                                    Text("\(glucoseValue) \(trendArrow)").font(.title)
                                }
                                Text("mg/dL").bold()
                            }.padding()
                            Spacer()
                        }.padding(5).background(Color.white).clipShape(Circle()).padding(.top,10)
                        GlucoseChartView(glucoseModel: glucoseModel, highAlert: $highAlert, lowAlert: $lowAlert, fullSize: $tabExpanded)
                    }else{
                        Text("Invalid Inputs").bold()
                        Text("Check credentials.json and PythonConfig.swift inputs")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                AlertSettingsView(glucoseModel:glucoseModel,highAlert:$highAlert,lowAlert:$lowAlert)
            }
        }.frame(width: tabExpanded ? 400 : 250, height:tabExpanded ? 400 : 250).background(backgroundColor.opacity(0.3))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(glucoseModel: GlucoseModel(), highAlert:.constant(160), lowAlert: .constant(75))
    }
}
