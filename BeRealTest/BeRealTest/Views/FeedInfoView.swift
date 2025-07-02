//
//  FeedInfoView.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import SwiftUI

struct FeedInfoView: View {
    let story: Story

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                print("tapped")
            }) {
                HStack {
                    Spacer().fixedSize()
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    Text(story.likes.description)
                        .foregroundStyle(.black)
                        .font(.caption)
                
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    Text(story.comments.description)
                        .foregroundStyle(.black)
                        .font(.caption)
    
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    Text(story.shares.description)
                        .foregroundStyle(.black)
                        .font(.caption)
                }
                
            }
            
            VStack(alignment: .leading){
                HStack(spacing: 2) {
                    Text(story.user.name)
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .lineLimit(1)
                    
                    
                }
                Text("Posted on \(story.timestamp.formatted(date: .abbreviated, time: .shortened))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
    }
}


