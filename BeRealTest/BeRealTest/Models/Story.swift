//
//  Story.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import Foundation

struct Story: Identifiable {
    let id: UUID
    let user: User
    let imageURL: String
    let timestamp: Date
}
