//
//  ContentView.swift
//  Better Rest
//
//  Created by Midna on 9/8/23.
//

//  Import CoreML to bring in ML libraries
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    var calculatedBedtime: Date {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 //  Convert from seconds to hours
            let minute = (components.minute ?? 0) * 60  //  Convert from seconds to minutes
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount - 1))
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime
        } catch {
            //something went wrong
        }
        return Date.now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        
                        Spacer()
                        
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    
                    VStack (alignment: .leading, spacing: 0) {
                        Text("How much sleep do you want?")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            .foregroundColor(.accentColor)
                    
                    }
                    
                    VStack (alignment: .leading, spacing: 0) {
                        Text("Daily coffee intake?")
                            .font(.headline)
                             
                        Picker("^[\(coffeeAmount + 1) cup](inflect: true)", selection:$coffeeAmount) {
                            ForEach(1..<20) {
                                Text("\($0)")
                            }
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Calculated Bedtime:")
                            .font(.title)
                        
                    Spacer()
                        Text("\(calculatedBedtime.formatted(date: .omitted, time: .shortened))")
                            .font(.title)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .navigationTitle("Better Rest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
