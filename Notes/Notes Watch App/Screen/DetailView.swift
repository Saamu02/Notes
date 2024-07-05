//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Ussama Irfan on 05/07/2024.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTY
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    
    // MARK: - BODY
    var body: some View {

        VStack(alignment: .center, spacing: 3) {
                
            HeaderView()
            
            Spacer()
            
            ScrollView(.vertical) {
                
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()

            HStack(alignment: .center) {
                
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                
                Text("\(index + 1) / \(count)")
                
                
                Spacer()

                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                      isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                      CreditsView()
                    })
            }
            .foregroundStyle(.secondary)
            
        }//: VSTACK
    }
}

#Preview {
    let sampleNote = Note(id: UUID(), text: "Sample Note")
    return DetailView(note: sampleNote, count: 3, index: 1)
}
