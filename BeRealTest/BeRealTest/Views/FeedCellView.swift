//
//  FeedCellView.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//
import SwiftUI

struct FeedCellView: View {
    let story: Story
    @State var isSubbed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: story.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Rectangle().fill(Color.gray.opacity(0.3))
                }
                .frame(height: 300)
                .clipped()
                VStack(spacing: 5) {
                    Spacer().fixedSize()
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
                                .foregroundStyle(.white)
                        Spacer()
                            Button(action: {
                                isSubbed.toggle()
                            }) {
                                Text(isSubbed ? "unsubscribe_text": "subscribe_text")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .frame(width: 80, height: 20)
                                    .overlay(RoundedRectangle(cornerRadius: 1)
                                        .stroke(Color.white, lineWidth: 1))
                                
                            }
                        
                            Button(action: {
                                print("Tapped")
                            }) {
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .padding(.horizontal)
               
            }
            
            FeedInfoView(story: story)
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}
#Preview {
    FeedCellView(story: Story(id: UUID(), user: User(id: UUID(), name: "Rastislav", profileImageURL: ""), imageURL: "", timestamp: Date(), caption: "TestingTestingTestingTestingTestingTestingTesting", likes: 6546544, shares: 64512, comments: 65232))
}
