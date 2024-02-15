//
//  AlertSettings.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/10/24.
//
import SwiftUI

struct AlertSettingsView: View{
    @ObservedObject var glucoseModel: GlucoseModel
    @Binding var highAlert: Int
    @Binding var lowAlert: Int
    
    @State private var menuExpanded: Bool = false
    
    var body: some View{
        
        VStack(alignment:.trailing,spacing:0){
            // Menu Button
            Button{
                menuExpanded.toggle()
            }label:{
                Image(systemName: "line.3.horizontal").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
            }.buttonStyle(ClearButtonStyle()).focusable(false)
            
            if menuExpanded{
                VStack{
                    Text("Alert Settings")
                    
                    // High Alert
                    HStack{
                        Button{
                            // Decrease high alert, must stay 5 above low alert
                            if highAlert - lowAlert > 5{
                                highAlert -= 5
                            }
                        }label:{
                            Image(systemName: "minus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                        }.buttonStyle(MenuButtonStyle())
                        Text("\(highAlert)").frame(width:25)
                        Button{
                            // Max high alert is 300
                            if highAlert < 300{
                                highAlert += 5
                            }
                        }label:{
                            Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                        }.buttonStyle(MenuButtonStyle())
                    }
                    
                    // Low Alert
                    HStack{
                        Button{
                            // Min low alert is 60
                            if lowAlert > 60{
                                lowAlert -= 5
                            }
                        }label:{
                            Image(systemName: "minus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                        }.buttonStyle(MenuButtonStyle())
                        Text("\(lowAlert)").frame(width:25)
                        Button{
                            // Increase low alert, must stay 5 below high alert
                            if highAlert - lowAlert > 5{
                                lowAlert += 5
                            }
                        }label:{
                            Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                        }.buttonStyle(MenuButtonStyle())
                    }
                    
                    // Refresh Button
                    Button("Refresh Data") {
                        glucoseModel.fetchGlucoseData()
                    }.padding(.top,5).buttonStyle(MenuButtonStyle())
                    
                }.padding().background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10.0)).shadow(radius: 5)
            }
        }.padding()
            .onAppear{
            menuExpanded = false
        }

    }
    
}
