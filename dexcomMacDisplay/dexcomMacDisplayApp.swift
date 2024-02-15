//
//  dexcomMacDisplayApp.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/9/24.
//

import SwiftUI

@main
struct DexcomMacDisplayApp: App {
    @StateObject private var glucoseModel = GlucoseModel()
    @AppStorage("highAlert") var highAlert: Int = 180
    @AppStorage("lowAlert") var lowAlert: Int = 75
    
    var body: some Scene {
        MenuBarExtra{
            ContentView(glucoseModel: glucoseModel, highAlert:$highAlert, lowAlert:$lowAlert)
        }label:{
            // Menu Bar Label and Alert
            HStack{
                // Alerts
                if glucoseModel.glucoseValue > highAlert{
                    Image(systemName: "exclamationmark.triangle")
                }else if glucoseModel.glucoseValue < lowAlert{
                    Image(systemName: "exclamationmark.triangle.fill")
                }
                Text("\(glucoseModel.glucoseValue) \(glucoseModel.trendArrow)")
            }.onAppear{
                // Initial data fetch on app launch
                glucoseModel.fetchGlucoseData()
                // Set up a timer to refresh data every 5 minutes
                Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { _ in
                    glucoseModel.fetchGlucoseData()
                }
            }
        }.menuBarExtraStyle(.window)
        // Updates to badge with alerts, responds to new reading and change of alert bounds
        .onChange(of: glucoseModel.glucoseValue) { _, _ in
            setBadge(value: glucoseModel.glucoseValue)
        }.onChange(of: highAlert) { _, _ in
            setBadge(value: glucoseModel.glucoseValue)
        }.onChange(of: lowAlert) { _, _ in
            setBadge(value: glucoseModel.glucoseValue)
        }
    }
    
    private func setBadge(value: Int){
        if value > highAlert {
            NSApp.dockTile.showsApplicationBadge = true
            NSApp.dockTile.badgeLabel = "↑"
            NSApp.dockTile.display()
        } else if value < lowAlert {
            NSApp.dockTile.showsApplicationBadge = true
            NSApp.dockTile.badgeLabel = "↓"
            NSApp.dockTile.display()
        }else{
            NSApp.dockTile.showsApplicationBadge = false
        }
    }
    
}

