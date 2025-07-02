//
//  FeedCellView.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import SwiftUI

struct FeedCellView: View {
    let story: Story
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: story.user.profileImageURL)) { image in
                    image.resizable()
                } placeholder: {
                    Circle().fill(Color.gray)
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                
                Text(story.user.name)
                    .font(.subheadline)
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal)
            
            AsyncImage(url: URL(string: story.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Rectangle().fill(Color.gray.opacity(0.3))
            }
            .frame(height: 300)
            .clipped()
            VStack(spacing: 20) {
                Button(action: {
                    print("tapped")
                }) {
                    HStack {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.black)
                        Text("250K")
                            .foregroundStyle(.black)
                            .font(.caption)
                    }
                    HStack {
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.black)
                        Text("250K")
                            .foregroundStyle(.black)
                            .font(.caption)
                    }
                    HStack {
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.black)
                        Text("250K")
                            .foregroundStyle(.black)
                            .font(.caption)
                    }
                    
                }
                
                Text("Posted on \(story.timestamp.formatted(date: .abbreviated, time: .shortened))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}
#Preview {
    FeedCellView(story: Story(id: UUID() , user: User(id: UUID(), name: "Ras", profileImageURL: ""), imageURL: "", timestamp: Date.now))
}
