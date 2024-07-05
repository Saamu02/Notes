//
//  Note.swift
//  Notes Watch App
//
//  Created by Ussama Irfan on 05/07/2024.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    let text: String
}
