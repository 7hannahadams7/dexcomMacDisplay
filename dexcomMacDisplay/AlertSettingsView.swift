//
//  AlertSettings.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/10/24.
//

import SwiftUI

struct AlertSettingsView: View{
    @Binding var highAlert: Int
    @Binding var lowAlert: Int
    
    var body: some View{
        VStack{
            HStack{
                Button{
                    // Decrease high alert, must stay 5 above low alert
                    if highAlert - lowAlert > 5{
                        highAlert -= 5
                    }
                }label:{
                    Image(systemName: "minus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                }
                Text("\(highAlert)").frame(width:25)
                Button{
                    // Max high alert is 300
                    if highAlert < 300{
                        highAlert += 5
                    }
                }label:{
                    Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                }
            }
            HStack{
                Button{
                    // Min low alert is 60
                    if lowAlert > 60{
                        lowAlert -= 5
                    }
                }label:{
                    Image(systemName: "minus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                }
                Text("\(lowAlert)").frame(width:25)
                Button{
                    // Increase low alert, must stay 5 below high alert
                    if highAlert - lowAlert > 5{
                        lowAlert += 5
                    }
                }label:{
                    Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit).frame(width:15,height:15)
                }
            }
        }.padding()

    }
    
}
