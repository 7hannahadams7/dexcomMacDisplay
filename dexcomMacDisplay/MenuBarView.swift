//
//  MenuBarView.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/10/24.
//

import SwiftUI

//struct MenuBarView: View {
//    @ObservedObject var glucoseModel: GlucoseModel
//    @Binding var highAlert: Int
//    @Binding var lowAlert: Int
//    
//    var body: some View {
//        // Set background color based on current value
//        let glucoseValue = glucoseModel.glucoseValue
//        let trendArrow = glucoseModel.trendArrow
//        
//        var backgroundColor: Color{
//            if glucoseValue > highAlert{
//                return Color.yellow
//            }else if glucoseValue < lowAlert{
//                return Color.red
//            }else{
//                return Color.gray
//            }
//        }
//        
//        VStack{
//            HStack{
//                Spacer()
//                VStack{
//                    HStack{
//                        Text("\(glucoseValue) \(trendArrow)").font(.title)
//                    }
//                    Text("mg/dL").bold()
//                }.padding()
//                Spacer()
//            }.background(Color.white).clipShape(Circle()).padding(.top,5)
//            GlucoseChartView(glucoseModel: glucoseModel, highAlert: $highAlert, lowAlert: $lowAlert)
//        }.frame(width: 250, height:250).background(backgroundColor.opacity(0.3))
//    }
//}
//
//#Preview {
//    MenuBarView(glucoseModel: GlucoseModel(), highAlert:.constant(160), lowAlert: .constant(75))
//}
