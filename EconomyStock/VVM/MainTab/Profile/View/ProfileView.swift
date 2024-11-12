//
//  ProfileView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    HStack {
                        Text("\(viewModel.user?.username ?? "닉네임")")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                    .padding(.leading, 10)
                    
                    HStack(spacing: 0) {
                        Image("Basic_Toktok")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .padding(.top, 50)
                            .padding(.leading)
                        
                        if let percentage = viewModel.user?.totalStudyingPercentage {
                            switch percentage {
                                
                            case 0..<20:
                                LottieViewConverter(fileName: "ProfilePlantLevel1", loopMode: .playOnce, width: 100, height: 100)
                            case 20..<40:
                                LottieViewConverter(fileName: "ProfilePlantLevel2", loopMode: .playOnce, width: 100, height: 100)
                            case 40..<60:
                                LottieViewConverter(fileName: "ProfilePlantLevel3", loopMode: .playOnce, width: 100, height: 100)
                            case 60..<80:
                                LottieViewConverter(fileName: "ProfilePlantLevel4", loopMode: .playOnce, width: 100, height: 100)
                            case 80..<100:
                                LottieViewConverter(fileName: "ProfilePlantLevel5", loopMode: .playOnce, width: 100, height: 100)
                                
                            default:
                                LottieViewConverter(fileName: "ProfilePlantLevel1", loopMode: .playOnce, width: 100, height: 100)
                            }
                            
                        } else {
                            LottieViewConverter(fileName: "ProfilePlantLevel5", loopMode: .playOnce, width: 100, height: 100)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
                
                HStack {
                    VStack {
                        
                    }
                    
                    VStack {
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                .padding(.horizontal, 10)
                .padding(.top, 10)
                
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 30)
                        
                        Text("계정 정보")
                            .font(.system(size: 15))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right").padding(.trailing, 30)
                    }
                    
                    Divider()
                        .padding()
                    
                    HStack {
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 30)
                        
                        Text("알림 관리")
                            .font(.system(size: 15))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right").padding(.trailing, 30)
                    }
                }
                .padding(.top, 30)
                
                Button {
                    viewModel.singOut()
                } label: {
                    Text("로그아웃")
                        .font(.system(size: 13))
                        .padding(.top, 60)
                }
            }
        }
        .modifier(NavigationTitleModifier(title: "프로필"))
    }
}

#Preview {
    ProfileView()
        .environment(NavigationRouter())
}
