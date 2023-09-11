//
//  File.swift
//  Better Rest
//
//  Created by Midna on 9/8/23.
//

import Foundation


/*
 //
 //  ContentView.swift
 //  Better Rest
 //
 //  Created by Midna on 9/8/23.
 //

 import SwiftUI

 struct ContentView: View {
     @State private var sleepAmount = 8.0
     @State private var wakeUp = Date.now
     
     
     var body: some View {
         VStack {
             Text(Date.now, format: .dateTime.day().month().year())
             DatePicker("Please enter a date: ", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
                 .labelsHidden()
             Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
             Text(Date.now.formatted(date: .long, time: .shortened))
         }
         
     }
     
     func exampleDate() {
         let tomorrow = Date.now.addingTimeInterval(86400)
         let range = Date.now...tomorrow
     }
     
     func trivialExample() {
         let now = Date.now
         let nextDay = Date.now.addingTimeInterval(86400)
         let range = now...nextDay
     }
     
     func anotherExample() {
         var components = DateComponents()
         components.hour = 8
         components.minute = 0
         
         let date = Calendar.current.date(from: components) ?? Date.now
     }
     
     func yetAnotherExample() {
         let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
         let hour = components.hour ?? 0
         let minute = components.minute ?? 0
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 */
