//
//  ContentView.swift
//  Better Rest
//
//  Created by Midna on 9/8/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        // Optional Init: Set range with in
        // Optional Init: Set Step with Step
        // Modifier .formatted auto formats value
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
