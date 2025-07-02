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
                    Text("250K")
                        .foregroundStyle(.black)
                        .font(.caption)
                
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    Text("1,356")
                        .foregroundStyle(.black)
                        .font(.caption)
    
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    Text("4,265")
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
                    Text("Random commment generated from api here so it can be truncated ")
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
#Preview {
    FeedInfoView(story: Story(id: UUID(), user: User(id: UUID(), name: "Rastislav", profileImageURL: ""), imageURL: "", timestamp: Date.now))
}

