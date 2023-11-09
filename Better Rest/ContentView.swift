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
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            // Single ended ranges possible using ellipse within in:
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
                .labelsHidden()
        }

    }

    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
