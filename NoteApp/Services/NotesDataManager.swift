//
//  NotesDataManager.swift
//  NoteApp
//
//  Created by Ильяс Жанаев on 30.07.2024.
//

import Foundation

final class NotesDataManager {
    static let shared = NotesDataManager()
    
    private let userDefaultsKey = "notes"
    
    private init() {}
    
    func saveNotes(_ notes: [Note]) {
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    
    func loadNotes() -> [Note] {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let notes = try? JSONDecoder().decode([Note].self, from: data) {
            return notes
        }
        return []
    }
}

