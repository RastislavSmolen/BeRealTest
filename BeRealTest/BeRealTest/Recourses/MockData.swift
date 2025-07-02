//
//  MockData.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import Foundation

struct MockData {
    static let users: [User] = (1...5).map {
        User(id: UUID(), name: "User \($0)", profileImageURL: "https://i.pravatar.cc/150?img=\($0)")
    }

    static let stories: [Story] = users.map {
        Story(id: UUID(), user: $0, imageURL: "https://picsum.photos/300/500?random=\(Int.random(in: 1...1000))", timestamp: Date())
    }
}
