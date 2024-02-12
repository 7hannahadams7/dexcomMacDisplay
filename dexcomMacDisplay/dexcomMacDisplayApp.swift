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
        WindowGroup {
            ContentView(glucoseModel: glucoseModel, highAlert:$highAlert, lowAlert:$lowAlert).frame(minWidth:200,minHeight:50)
        }.onChange(of: glucoseModel.glucoseValue) { _, _ in
            setBadge(value: glucoseModel.glucoseValue) // Update badge
        }.onChange(of: highAlert) { _, _ in
            setBadge(value: glucoseModel.glucoseValue) // Update badge
        }.onChange(of: lowAlert) { _, _ in
            setBadge(value: glucoseModel.glucoseValue) // Update badge
        }
        MenuBarExtra{
            MenuBarView(glucoseModel: glucoseModel, highAlert:$highAlert, lowAlert:$lowAlert)
        }label:{
            HStack{
                if glucoseModel.glucoseValue > highAlert{
                    Image(systemName: "exclamationmark.triangle")
                }else if glucoseModel.glucoseValue < lowAlert{
                    Image(systemName: "exclamationmark.triangle.fill")
                }
                Text("\(glucoseModel.glucoseValue) \(glucoseModel.trendArrow)")
            }
        }.menuBarExtraStyle(.window)
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

