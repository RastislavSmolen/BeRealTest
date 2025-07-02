//
//  StoryViewModel.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//

import Foundation

final class StoryViewModel: ObservableObject {
    @Published var stories: [Story] = []
    private var isLoading = false
    private var page = 0

    init() {
        loadMoreStories()
    }

    func loadMoreStories() {
        guard !isLoading else { return }
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let newStories = (1...10).map { _ in
                let user = User(
                    id: UUID(),
                    name: "User \(Int.random(in: 1...1000))",
                    profileImageURL: "https://i.pravatar.cc/150?u=\(UUID().uuidString)"
                )
                return Story(
                    id: UUID(),
                    user: user,
                    imageURL: "https://picsum.photos/300/500?random=\(UUID().uuidString)",
                    timestamp: Date()
                )
            }

            self.stories.append(contentsOf: newStories)
            self.page += 1
            self.isLoading = false
        }
    }
}
