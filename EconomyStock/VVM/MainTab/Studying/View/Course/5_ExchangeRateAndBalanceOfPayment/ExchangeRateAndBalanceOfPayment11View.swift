//
//  ExchangeRateAndBalanceOfPayment11View.swift
//  EconomyStock
//
//  Created by 권형일 on 12/1/24.
//

import SwiftUI

struct ExchangeRateAndBalanceOfPayment11View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Environment(CourseListViewCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage = false
//    @State private var nextScrollpart = false
    
    @State private var completeButton = false
    @State private var beforeButton = false
    
    @State private var popup = false
    @State private var popupComplete = true
    
    @State private var loadingBarState = false
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ZStack {
                    ScrollView {
                        HStack {
                            Text("4.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("마무리")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("각각의 장단점이 존재하기에 환율이 너무 높은 것도, 낮은 것도 모두 좋지 않아요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentText1_2 {
                                        (Text("세계화로 인해 국제무역이 활발해짐에 따라 ")
                                        + Text("환율과 국제수지를 적정 수준으로 잘 유지")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                        + Text("하는 것이 점점 더 중요해지고 있어요"))
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 30)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        
//                        ZStack {
//                            if nextScrollpart {
//                                VStack {
//                                    
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                            Rectangle()
//                                .fill(.clear)
//                                .frame(width: 100, height: 300)
//                        }
//                        
//                        Rectangle()
//                            .fill(.clear)
//                            .frame(width: 100, height: 85)
//                            .id("bottom")
                    }
                    
                    if completeButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    popup = true
                                } label: {
                                    LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
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
            }
            .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.smooth(duration: 1.0)) {
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentText1_2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                completeButton = true
                                                
//                                                proxy.scrollTo("bottom", anchor: .top)
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation(.smooth(duration: 1.0)) {
                                                        beforeButton = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
//                    if progress.count == 2 {
//                        withAnimation {
//                            proxy.scrollTo("bottom", anchor: .top)
//                        }
//                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                            withAnimation(.smooth(duration: 1.0)) {
//                                nextScrollpart = true
//                                
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                    withAnimation(.smooth(duration: 1.0)) {
//                                        
//                                    }
//                                }
//                            }
//                        }
//                    }
                }
            }
        }
        .popup(isPresented: $popup) {
            VStack {
                if popupComplete {
                    LottieView(fileName: "CourseComplete", loopMode: .playOnce, scale: 1.3, width: 200, height: 200)
                } else {
                    LottieView(fileName: "ExchangeRateAndBalanceOfPaymentCourseCover", loopMode: .loop, width: 150, height: 150)
                    
                    Text("V 환율과 국제수지")
                        .font(.system(size: 30, design: .serif))
                        .fontWeight(.bold)
                    
                    Text("축하드려요!")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    Text("강의를 성공적으로 마쳤어요!")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                    
                    Button {
                        withAnimation(.smooth(duration: 0.2)) {
                            loadingBarState = true
                        }
                        
                        if AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < viewModel.currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage = viewModel.currentPage
                            
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: viewModel.currentPage)
                            }
                        }
                        
                        // CurrentUser의 lastPage 값 바꾸기 (1페이지로 초기화)
                        AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage = 1
                        
                        courseListViewCapule.isUpdate.toggle()
                        
                        // DB User의 lastPage 값 바꾸기 (1페이지로 초기화)
                        Task {
                            await AuthManager.shared.updateCourseLastPage(courseType: viewModel.course.type, lastPage: 1)
                        }
            
                        navigationRouter.popToRoot()
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 80, height: 40)
                            .foregroundStyle(Color.ESTitle)
                            .overlay {
                                Text("돌아가기")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                            }
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                            .padding(.top, 30)
                            
                    }
                }
            }
            .frame(width: 300, height: 500)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                    withAnimation(.smooth(duration: 1.0)) {
                        popupComplete = false
                    }
                }
            }
        } customize: {
            $0
                .animation(.spring(duration: 0.7))
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.gray.opacity(0.8))
        }
        .overlay {
            if loadingBarState {
                LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
                    .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    ExchangeRateAndBalanceOfPayment11View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}