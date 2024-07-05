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
    
    
    // MARK: - BODY
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let sampleNote = Note(id: UUID(), text: "Sample Note")
    return DetailView(note: sampleNote, count: 3, index: 1)
}
