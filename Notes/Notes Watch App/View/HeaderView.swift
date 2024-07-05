//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Ussama Irfan on 05/07/2024.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        
        VStack {
            
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HSTACK
            .foregroundStyle(.accent)
        } //: VSTACK
    }
}

#Preview {
    HeaderView(title: "Credits")
}
