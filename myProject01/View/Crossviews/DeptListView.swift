//
//  DeptListView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/17.
//

import SwiftUI

struct DeptListView: View {
    
    // --------------- //
    // EnvironmentObject
    // StateObject
    // Binding
    // State
    @State var searchText: String = "" // 篩選器：搜尋字串
    // --------------- //
    
    let deptList: [deptListModel] // 傳入要顯示的所有科系
    let title: String // 傳入 Title
    let displayMore: Bool // 傳入是否顯示更多
    
    let gradeData: gradeData // 傳入該筆資料的成績
    
    // 自訂篩選器
    
    // 篩選：搜尋字串
    
    var filteredDeptList: [deptListModel] {
        if searchText.isEmpty {
            return deptList
        } else {
            return deptList.filter { dept in
                dept.fullName.contains(searchText) || dept.id.contains(searchText) || dept.departmentAbbreviation.contains(searchText)
            }
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            HStack{
                Text(title)
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            
            VStack{
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        VStack{
                            Text("校系資料")
                                .font(.caption)
                            Text("\(deptList.count.description)")
                            .font(.title3)
                            .bold()
                        }
                        if (!searchText.isEmpty) {
                            VStack{
                                Text("搜尋詞條")
                                    .font(.caption)
                                Text(searchText)
                                    .font(.title3)
                                    .bold()
                                    .lineLimit(1)
                            }
                        }
                        if (filteredDeptList.count != deptList.count){
                            VStack{
                                Text("篩選校系")
                                    .font(.caption)
                                Text("\(filteredDeptList.count.description)")
                                    .font(.title3)
                                    .bold()
                            }
                        }
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray))
                        TextField("搜尋學校或科系", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding(10)
                    .background(Color(.quaternarySystemFill))
                    .cornerRadius(10)
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
                
                LazyVStack {
                    ForEach(filteredDeptList) { dept in
                        NavigationLink(destination: DeptDetailView(department: dept, data: gradeData, displayMore: displayMore)){
                            DeptRowView(department: dept)
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            .background(Color(.secondarySystemBackground))
            
        }
    }
}
