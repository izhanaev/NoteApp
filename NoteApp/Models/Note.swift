//
//  Note.swift
//  NoteApp
//
//  Created by Ильяс Жанаев on 30.07.2024.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var content: String
    
    init(id: UUID = UUID(), title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}

