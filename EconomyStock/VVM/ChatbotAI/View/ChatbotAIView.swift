//
//  ChatbotAIView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct ChatbotAIView: View {
    @State private var viewModel = ChatbotAIViewModel()
    
    @State var position = ScrollPosition()
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    VStack {
                        ZStack {
                            LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.4, width: 160, height: 160)
                                .blur(radius: 1.5)
                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                            
                            Image("Chatbot_Toktok")
                                .resizable()
                                .frame(width: 95, height: 90)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        }
                        
                        VStack(spacing: 20) {
                            ForEach(viewModel.messages) { message in
                                HStack {
                                    if message.isUser {
                                        Spacer()
                                        
                                        ChatBubbleView(text: message.text, isUser: true)
                                            .padding(.trailing)
                                            .shadow(color: .gray.opacity(0.1), radius: 10, x: 5, y: 5)
                                        
                                    } else {
                                        ChatBubbleView(text: message.text, isUser: false)
                                            .padding(.leading)
                                            .shadow(color: .gray.opacity(0.1), radius: 10, x: 5, y: 5)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .scrollIndicators(.never)
                .scrollPosition($position)
                
                VStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            position.scrollTo(edge: .bottom)
                        }
                    } label: {
                        Image(systemName: "arrowshape.down.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.regularMaterial)
                            .padding(.bottom, 5)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            HStack {
                TextField("질문을 입력하세요", text: $viewModel.prompt)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await viewModel.requestChatbot()
                    }
                } label: {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color.aiGradient)
                        .overlay {
                            Image(systemName: "arrow.up")
                                .foregroundStyle(.white)
                                .fontWeight(.black)
                                .scaleEffect(1.1)
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 20)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                }
            }
            .frame(height: 50)
            .background(.regularMaterial)
            .cornerRadius(20, corners: .allCorners)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .shadow(color: .gray.opacity(0.1), radius: 10, x: 5, y: 5)

        }
        .modifier(NavigationBackModifier())
        .background(LottieView(fileName: "AIBackground", loopMode: .loop, scale: 1.8, width: 300, height: 530)
            .opacity(0.4))
    }
}

#Preview {
    ChatbotAIView()
        .environment(NavigationRouter())
}
