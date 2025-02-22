//
//  DeptRowView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/10.
//

import SwiftUI

struct DeptRowView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject var data: UserDef
    // StateObject
    // Binding
    // State
    @State var showAlert: Bool = false
    // --------------- //
    
    var department: deptListModel
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    HStack{
                        Text(department.fullName)
                        Spacer()
                    }
                    HStack{
                        Text(department.id + "·" + department.enrollmentQuota)
                        Spacer()
                    }
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundColor(Color(.systemGray))
                }
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(.systemGray))
                    .padding(.trailing, 5)
            }
        }
        .padding(10)
        .background(Color(.quaternarySystemFill))
        .cornerRadius(10)
        .contextMenu{
            
            Button(role: .none){
                if data.favoriteDept.contains(department.id) {
                    data.favoriteDept.remove(at: Int(data.favoriteDept.firstIndex(of: department.id)!))
                } else {
                    data.favoriteDept.append(department.id)
                }
            } label: {
                Label(data.favoriteDept.contains(department.id) ? "移除最愛" : "加入最愛", systemImage: data.favoriteDept.contains(department.id) ? "heart.fill" : "heart")
            }
            
            Button(role: .none){
                let image = ShareImgView(department: department).asUiImage()
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                showAlert = true
            } label: {
                Label("分享", systemImage: "square.and.arrow.up")
            }
            
        }
        .alert("分享成功", isPresented: $showAlert){
            Button("好") {}
        } message: {
            Text("已將科系資訊分享圖片儲存至相簿")
        }
    }
}
