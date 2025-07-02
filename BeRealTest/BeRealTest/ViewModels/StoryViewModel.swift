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
                    timestamp: Date(),
                    caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    likes: 3145,
                    shares: 464652,
                    comments: 462135
                )
            }

            self.stories.append(contentsOf: newStories)
            self.page += 1
            self.isLoading = false
        }
    }
}
