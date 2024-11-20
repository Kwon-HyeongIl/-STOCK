//
//  StudyView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct CourseListView: View {
    @Environment(CourseListViewCapsule.self) var capsule
    @State private var viewModel = CourseListViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(viewModel.courses) { course in
                    CourseCoverView(course: course)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                }
            }
        }
        .modifier(NavigationTitleModifier(title: "학습"))
        .scrollIndicators(.never)
        .onChange(of: capsule.isUpdate) {
            viewModel.updateAllCourses()
        }
    }
}

#Preview {
    CourseListView()
}
