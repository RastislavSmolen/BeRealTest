//
//  FeedViewModel.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import Foundation

final class FeedViewModel: ObservableObject {
    @Published var posts: [Story] = []
    @Published var isLoading = false
    private let pageSize = 10

    init() {
        loadMorePosts()
    }

    func loadMorePosts() {
        guard !isLoading else { return }
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let newPosts = (1...self.pageSize).map { _ in
                let user = User(
                    id: UUID(),
                    name: "User \(Int.random(in: 100...999))",
                    profileImageURL: "https://i.pravatar.cc/150?u=\(UUID().uuidString)"
                )
                return Story(
                    id: UUID(),
                    user: user,
                    imageURL: "https://picsum.photos/400/600?random=\(UUID().uuidString)",
                    timestamp: Date(),
                    caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    likes: 1641321,
                    shares: 646213,
                    comments: 46432
                )
            }

            self.posts.append(contentsOf: newPosts)
            self.isLoading = false
        }
    }
}
