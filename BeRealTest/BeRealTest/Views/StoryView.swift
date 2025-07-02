//
//  StoryView.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import SwiftUI

struct StoryBubbleView: View {
    let story: Story

    var body: some View {
        VStack(spacing: 1) {
            AsyncImage(url: URL(string: story.user.profileImageURL)) { image in
                image.resizable()
            } placeholder: {
                Circle().fill(Color.gray.opacity(0.3))
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.purple, lineWidth: 3)
            )

            Text(story.user.name)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 70)
    }
}
#Preview {
    HStack {
        StoryBubbleView(story: .init(id: .init(), user: .init(id: .init(), name: "Test", profileImageURL: ""), imageURL: "", timestamp: Date()))
        StoryBubbleView(story: .init(id: .init(), user: .init(id: .init(), name: "Test", profileImageURL: ""), imageURL: "", timestamp: Date()))

    }
}
