//
//  DeptDetailView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/10.
//

import SwiftUI

struct DeptDetailView: View {
    
    // --------------- //
    // EnvironmentObject
    // StateObject
    // Binding
    // State
    @State private var isShowSheet = false
    @State var sheetExplansion: String?
    // --------------- //
    
    var department: deptListModel
    var data: gradeData
    var displayMore: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack{
               Spacer()
           }
           .padding(.horizontal)
           .padding(.bottom, 10)
            
            VStack{
                VStack(alignment: .leading){
                    DepartmentHeaderView(department: department)
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                .background(Color(.systemBackground))
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 20,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0
                    )
                )
            }
            .background(Color(.secondarySystemBackground))
            
            ScrollView {
                
                Color.clear
                    .padding(.bottom, 5)
                
                if displayMore { PassChanceQuickView(department: department, data: data) } // 需要 data
                
                EnrollmentQuotaView(department: department)
                
                FirstStageTestView(department: department, data: data, displayMore: displayMore) // 需要 data
                
                FirstStageFilterView(department: department)
                
                FirstStageResultView(department: department, data: data, displayMore: displayMore) // 需要 data
                
                SecondStageSelectionView(department: department)
                
                DepartmentNotesView(department: department)
                
                if displayMore { PassChanceView(department: department, data: data) } // 需要 data
                
            }
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            .background(Color(.secondarySystemBackground))
            
        }
    }
    
}

