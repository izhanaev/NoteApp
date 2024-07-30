//
//  NoteDetailView.swift
//  NoteApp
//
//  Created by Ильяс Жанаев on 30.07.2024.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var content: String = ""
    
    var viewModel: NotesViewModel?
    var note: Note?
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextEditor(text: $content)
                .padding()
                .frame(height: 200)
                .border(Color.gray, width: 1)
            
            Button(action: saveNote) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(note == nil ? "New Note" : "Edit Note")
        .onAppear {
            if let note = note {
                title = note.title
                content = note.content
            }
        }
    }
    
    private func saveNote() {
        guard let viewModel = viewModel else { return }
        
        if let note = note {
            viewModel.updateNote(note.id, title: title, content: content)
        } else {
            viewModel.addNote(title: title, content: content)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return NoteDetailView()
    }
}
