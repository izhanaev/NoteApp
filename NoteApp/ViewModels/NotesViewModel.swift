//
//  NotesViewModel.swift
//  NoteApp
//
//  Created by Ильяс Жанаев on 30.07.2024.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    private var dataManager: NotesDataManager
    
    init(dataManager: NotesDataManager = .shared) {
        self.dataManager = dataManager
        loadNotes()
    }
    
    func addNote(title: String, content: String) {
        let newNote = Note(title: title, content: content)
        notes.append(newNote)
        saveNotes()
    }
    
    func updateNote(_ id: UUID, title: String, content: String) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes[index].title = title
            notes[index].content = content
            saveNotes()
        }
    }
    
    func removeNote(at indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
        saveNotes()
    }
    
    private func saveNotes() {
        dataManager.saveNotes(notes)
    }
    
    private func loadNotes() {
        notes = dataManager.loadNotes()
    }
}
