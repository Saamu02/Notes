//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Ussama Irfan on 05/07/2024.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTY
    @AppStorage("lineCount") private var lineCount: Int = 2
    @State private var value: Float = 1.0
    
    // MARK: - FUNCTION
    func update() {
        lineCount = Int(value)
    }
    
    // MARK: - BODY
    var body: some View {
        
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
            .tint(.accent)
        } //: VSTACK
        .onAppear {
            value = Float(lineCount)
        }
    }
}

#Preview {
    SettingsView()
}
