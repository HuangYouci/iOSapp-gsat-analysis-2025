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
    @EnvironmentObject var data: UserData
    @EnvironmentObject var favData: UserFavData
    // StateObject
    // Binding
    // State
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
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
                    if favData.favoriteDept.contains(department.id) {
                        favData.favoriteDept.remove(at: Int(favData.favoriteDept.firstIndex(of: department.id)!))
                    } else {
                        favData.favoriteDept.append(department.id)
                    }
                } label: {
                    Label(favData.favoriteDept.contains(department.id) ? "移除最愛" : "加入最愛", systemImage: favData.favoriteDept.contains(department.id) ? "heart.fill" : "heart")
                }
            
            Button(role: .none){
                alertMessage = favData.addChoiceDept(deptID: department.id)
                showAlert = true
            } label: {
                Label(favData.choiceDept.contains(department.id) ? "移除志願" : "加入志願", systemImage: favData.choiceDept.contains(department.id) ? "minus" : "plus")
            }
                
                Button(role: .none){
                    let image = ShareImgView(department: department).asUiImage()
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    alertMessage = "輸出分享圖成功！若您有提供本程式讀取相簿權限，圖片應已儲存至裝置相簿。"
                    showAlert = true
                } label: {
                    Label("分享", systemImage: "square.and.arrow.up")
                }
                
            }
        .alert("\(department.fullName)", isPresented: $showAlert){
            Button("好") {}
        } message: {
            Text(alertMessage)
        }
        
    }
}
