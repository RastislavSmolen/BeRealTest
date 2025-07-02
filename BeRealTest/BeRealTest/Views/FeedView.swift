//
//  FeedView.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import SwiftUI

struct FeedView: View {
    @StateObject private var storyViewModel = StoryViewModel()
    @StateObject private var feedViewModel = FeedViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: - Horizontal Stories
                    HStack {
                        Text("stories_text")
                            .font(.headline)
                            .padding(.horizontal)
                        Spacer()
                        Button(action: {
                            print("Button Tapped")
                        }) {
                            Image(systemName: "heart")
                                   .resizable()
                                   .frame(width: 20, height: 20)
                                   .foregroundStyle(.black)
                        }
                        Button(action: {
                            print("")
                        }) {
                            Image(systemName: "paperplane")
                                   .resizable()
                                   .frame(width: 20, height: 20)
                                   .foregroundStyle(.black)
                        }
                        Spacer().fixedSize()

                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 2) {
                            ForEach(Array(storyViewModel.stories.enumerated()), id: \.1.id) { index, story in
                                StoryBubbleView(story: story)
                                    .onAppear {
                                        if index == storyViewModel.stories.count - 2 {
                                            storyViewModel.loadMoreStories()
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                    }

                    Divider()
                        .padding(.vertical)

                    // MARK: - Vertical Feed (Infinite Scroll)
                    LazyVStack {
                        ForEach(Array(feedViewModel.posts.enumerated()), id: \.1.id) { index, story in
                            FeedCellView(story: story)
                                .onAppear {
                                    if index == feedViewModel.posts.count - 2 {
                                        feedViewModel.loadMorePosts()
                                    }
                                }
                            if feedViewModel.isLoading {
                                ProgressView()
                                    .padding()
                            }
                        }

                        if feedViewModel.posts.isEmpty {
                            ProgressView()
                                .padding()
                        }
                    }
                }
              
            }
            .navigationTitle("BeReal")
            
        }
    }
}

#Preview {
    FeedView()
}
