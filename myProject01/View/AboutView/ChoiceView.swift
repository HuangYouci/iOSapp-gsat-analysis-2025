//
//  ChoiceView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/27.
//

import SwiftUI

struct ChoiceView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject private var userData: UserData
    @EnvironmentObject private var deptList: DeptDataModel
    @EnvironmentObject private var databaseInfo: DatabaseInfo
    @EnvironmentObject private var userFavData: UserFavData
    // StateObject
    // Binding
    // State
    @State private var choiceList: [String] = []
    // --------------- //
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack{
                Text("志願選填")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            
            VStack{
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Color.clear
                            .frame(height: 1)
                    }
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
                
                VStack(spacing: 10){
                    ForEach(choiceList.indices, id: \.self){ index in
                        HStack{
                            Text("#")
                                .foregroundStyle(Color(.systemGray3))
                            Text("\(index+1)")
                                .font(.title2)
                                .padding(.leading, -5)
                            if let department = deptList.departments.first(where: { $0.id == choiceList[index] }) {
                                NavigationLink(destination: DeptDetailView(department: department, data: gradeData(gradeCH: 11, gradeEN: 14, gradeMA: 7, gradeMB: 11, gradeSC: 12, gradeSO: 11, gradeEL: 1, gradePC: 3, gradePP: 3, gradeSK1: 1, gradeSK2: 0, gradeSK3: 0, gradeSK4: 0, gradeSK5: 0, gradeSKT: 0), displayMore: false)){
                                    DeptRowView(department: department)
                                }
                            } else {
                                noChoice()
                            }
                        }
                    }
                    ForEach(choiceList.count..<6, id: \.self){ index in
                        HStack{
                            Text("#")
                                .foregroundStyle(Color(.systemGray3))
                            Text("\(index+1)")
                                .font(.title2)
                                .padding(.leading, -5)
                            noChoice()
                        }
                    }
                }
                .padding(.horizontal)
            }
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            .background(Color(.secondarySystemBackground))
        }
        .onAppear {
            choiceList = userFavData.choiceDept
        }
    }
    
    private func noChoice() -> some View {
        HStack{
            VStack{
                HStack{
                    Text("尚未設置本志願")
                    Spacer()
                }
                HStack{
                    Text("請到科系列表中長按目標科系將其加入志願")
                    Spacer()
                }
                .font(.system(.footnote, design: .monospaced))
                .foregroundColor(Color(.systemGray))
            }
        }
        .padding(10)
        .background(Color(.quaternarySystemFill))
        .cornerRadius(10)
        .contextMenu{Text("請到科系列表長按目標科系將其加入志願！")}
    }
}

#Preview {
    ChoiceView()
        .environmentObject(DeptDataModel())
        .environmentObject(UserFavData())
        .environmentObject(UserData())
}
