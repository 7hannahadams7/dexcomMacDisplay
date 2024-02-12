//
//  GlucoseModel.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/9/24.
//

import Foundation

class GlucoseModel: ObservableObject {
    @Published var glucoseValue: Int = 0
    @Published var trendArrow: String = ""
    @Published var glucoseReadings: [Int] = []
    @Published var timeLabels: [Date] = []

    func fetchGlucoseData() {
        let process = Process()
        process.launchPath = PythonConfig.pythonPath
        process.arguments = [PythonConfig.pythonScriptPath]

        let pipe = Pipe()
        process.standardOutput = pipe

        process.launch()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print("PYTHON OUTPUT: ", output)
            let components = output.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            if components.count >= 2, let glucoseValue = Int(components[0]) {
                self.glucoseValue = glucoseValue
                self.trendArrow = components[1]
            } else {
                print("Invalid output format for current values from Python script.")
                self.glucoseValue = 0
                self.trendArrow = ""
            }

            if components.count >= 3 {
                let readings = components[2..<components.count]
                self.glucoseReadings = []
                for reading in readings{
                    if let value = Int(reading){
                        self.glucoseReadings.append(value)
                    }
                }
                
                // Generate time labels starting from current time and going backward in 5-minute increments
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"
                self.timeLabels = (0..<readings.count).map { i in
                    let time = Calendar.current.date(byAdding: .minute, value: -5 * i, to: currentDate) ?? currentDate
                    return time
                }
            } else {
                self.glucoseReadings = []
                self.timeLabels = []
            }
        }
    }

}
