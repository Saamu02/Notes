//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Ussama Irfan on 04/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    // MARK: - PROPERTY
    
    @State private var notes = [Note]()
    @State private var text = ""
    
    
    // MARK: - FUNCTION
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
        func saveNotes() {
        
        do {
            let data = try JSONEncoder().encode(notes)
            
            let url = getDocumentDirectory().appending(path: "notes")
            
            try data.write(to: url)
            
        } catch {
            print("Failed to save data")
        }
    }
    
    func loadNotes() {
        
        DispatchQueue.main.async {
            
            do {
                let url = getDocumentDirectory().appending(path: "notes")
                
                let data = try Data(contentsOf: url)
                
                notes = try JSONDecoder().decode([Note].self, from: data)
                
            } catch {
                print("Failed to retrieve data")
            }
        }
    }
    
    func deleteNote(offSets: IndexSet) {
        
        withAnimation {
            notes.remove(atOffsets: offSets)
            saveNotes()
        }
    }
    
    
    // MARK: - BODY
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HStack(alignment: .center, spacing: 6) {
                    
                    TextField("Add new note", text: $text)
                    
                    Button(action: {
                        
                        if text.isEmpty {
                            return
                        }
                        
                        let note = Note(id: UUID(), text: text)
                        
                        notes.append(note)
                        
                        text = ""
                        
                        saveNotes()
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 40, weight: .semibold))
                    })
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.accent)
                }//: HSTACK
                
                Spacer()
                
                if notes.count >= 1 {
                    
                    List {
                        
                        ForEach(0..<notes.count, id: \.self) { i in
                            
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }//: HSTACK
                            }//: NAVIGATION LINK
                        }//: LOOP
                        .onDelete(perform: { indexSet in
                            deleteNote(offSets: indexSet)
                        })
                    }//: LIST
                    
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(20)
                    Spacer()
                }
                
            }//: VSTACK
            .navigationTitle("Notes")
            .onAppear {
                loadNotes()
            }
        }//: NAVIGATION STACK
    }
}

#Preview {
    ContentView()
}
