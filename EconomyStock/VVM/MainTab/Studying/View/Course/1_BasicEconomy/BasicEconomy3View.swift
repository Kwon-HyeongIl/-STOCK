//
//  BasicEconomyPage3.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy3View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var bubble = false
    @State private var bubbleContent = false
    
    @State private var questionMark = false
    @State private var questionMarkContent = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ScrollView {
                    HStack {
                        Text("2.")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 3)
                        
                        Text("GDP (국내총생산)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .opacity(0.2)
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        VStack(spacing: 10) {
                            HStack {
                                Text("1) 소비 (Consumption)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 30)
                                    .padding(.top, 5)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("주로 가계에서 이루어지며. \n소득에 비례하고 이자율에 반비례해요")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 45)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    if progress.count >= 2 {
                        VStack {
                            HStack {
                                Image("Basic_Toktok")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                                    .padding(.top, 130)
                                
                                if bubble {
                                    ZStack {
                                        LottieViewConverter(fileName: "Bubble", loopMode: .playOnce, scale: 2.5, width: 180, height: 140)
                                        
                                        if bubbleContent {
                                            Text("월급이 올랐으니\n자동차를 사야지!")
                                                .font(.system(size: 13))
                                                .fontWeight(.semibold)
                                                .padding(.leading, 5)
                                                .padding(.bottom, 8)
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                if bubble {
                                    ZStack {
                                        LottieViewConverter(fileName: "Bubble", loopMode: .playOnce, scale: 2.5, width: 180, height: 140)
                                            .scaleEffect(x: -1, y: 1, anchor: .center)
                                        
                                        if bubbleContent {
                                            Text("예금 이자율이\n올랐네. 이번달은\n저축을 좀 해야겠어.")
                                                .font(.system(size: 13))
                                                .fontWeight(.semibold)
                                                .padding(.bottom, 14)
                                                .padding(.leading, 2)
                                        }
                                    }
                                }
                                
                                Image("Sad_Toktok")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                                    .padding(.top, 130)
                            }
                        }
                    }
                    
                    if questionMark {
                        VStack {
                            HStack(spacing: 5) {
                                LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                    .padding(.leading, 10)
                                
                                Text("이자율이란?")
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                    .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            
                            if questionMarkContent {
                                HStack(spacing: 5) {
                                    Text(":")
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black.opacity(0.6))
                                        .padding(.leading, 20)
                                        .padding(.bottom, 50)
                                    
                                    Text("이자율의 정의는 돈을 빌린 대가이지만, 돈의 가격이라고 생각하면 편해요. 또한, 이자율은 금리와 같은 의미를 가져요.")
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black.opacity(0.6))
                                        .padding(.bottom, 10)
                                    
                                    Spacer()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        .padding(.top, 30)
                        .onTapGesture {
                            withAnimation(.smooth(duration: 0.7)) {
                                questionMarkContent.toggle()
                                
                                if questionMarkContent {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        withAnimation(.smooth(duration: 0.7)) {
                                            proxy.scrollTo("button", anchor: .bottom)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 45)
                    }
                    
                    Spacer()
                    
                    if nextButton {
                        ZStack {
                            Button {
                                viewModel.currentPage += 1
                                navigationRouter.navigate(.BasicEconomy4View(viewModel))
                            } label: {
                                LottieViewConverter(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                    .id("button")
                            }
                            
                            if beforeButton {
                                HStack {
                                    Button {
                                        viewModel.currentPage -= 1
                                        navigationRouter.back()
                                    } label: {
                                        Image(systemName: "chevron.left")
                                            .font(.system(size: 25))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                            .padding()
                                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 60)
                                .padding(.trailing, 70)
                            }
                        }
                    }
                }
            }
            .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.smooth(duration: 1.0)) {
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            withAnimation(.smooth(duration: 1.0)) {
                                bubble = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        bubbleContent = true
                                    }
                                }
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextButton = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        beforeButton = true
                                        
                                        proxy.scrollTo("button", anchor: .bottom)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BasicEconomy3View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
