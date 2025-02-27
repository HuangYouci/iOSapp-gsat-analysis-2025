//
//  ChoiceView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/27.
//

//import SwiftUI
//
//struct ChoiceView: View {
//    
//    // --------------- //
//    // EnvironmentObject
//    // StateObject
//    @EnvironmentObject private var deptList: DeptDataModel
//    @EnvironmentObject private var databaseInfo: DatabaseInfo
//    // Binding
//    // State
//    @State private var choiceList: [String] = ["004142", "004292"]
//    // --------------- //
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("志願選填")
//                    .font(.title)
//                    .bold()
//                Spacer()
//            }
//            .padding(.bottom, 10)
//            
//            ScrollView {
//                VStack(spacing: 10){
//                    ForEach(choiceList.indices, id: \.self){ index in
//                        let choice = choiceList[index]
//                        HStack{
//                            Text("志願 #\(index+1)")
//                            Spacer()
//                        }
//                        if let department = deptList.departments.first(where: { $0.id == choiceList[index] }) {
//                            DeptRowView(department: department)
//                        } else {
//                            Text("未找到對應科系")
//                        }
//                    }
//                }
//            }
//        }
//        .padding()
//    }
//    
//    private func noChoice() -> some View {
//        VStack {
//            HStack{
//                VStack{
//                    HStack{
//                        Text("尚未設置本志願")
//                        Spacer()
//                    }
//                    HStack{
//                        Text("000000 · 0")
//                        Spacer()
//                    }
//                    .font(.system(.footnote, design: .monospaced))
//                    .foregroundColor(Color(.systemGray))
//                }
//                Image(systemName: "chevron.right")
//                    .foregroundColor(Color(.systemGray))
//                    .padding(.trailing, 5)
//            }
//        }
//        .padding(10)
//        .background(Color(.quaternarySystemFill))
//        .cornerRadius(10)
//        .contextMenu{Text("請到科系列表長按目標科系將其加入志願！")}
//    }
//}
//
//#Preview {
//    ChoiceView()
//        .environmentObject(DeptDataModel())
//        .environmentObject(UserFavData())
//}
