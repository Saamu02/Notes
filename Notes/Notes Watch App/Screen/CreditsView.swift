//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Ussama Irfan on 05/07/2024.
//

import SwiftUI

struct CreditsView: View {
   
    // MARK: - PROPERTY
    @State private var randomNumber: Int = Int.random(in: 1...3)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    // MARK: - BODY
    var body: some View {
        
        VStack() {
            
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            Text("Ussama Irfan")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        } //: VSTACK
    }
}

#Preview {
    CreditsView()
}
