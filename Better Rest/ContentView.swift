//
//  ContentView.swift
//  Better Rest
//
//  Created by Midna on 9/8/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        VStack {
            // modifier labelshidden allows Voice Over to give helpful description
            // Optional init displayComponents cleanly formats Dates and Times
            // iOS will automatically format date based on local conventions when given in Text( format: .dateTime)
            Text(Date.now, format: .dateTime.day().month().year())
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()

        }
    }
    
    func exampleDates() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        return date
    }
    
    func exampleDates2() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minutes = components.minute ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
