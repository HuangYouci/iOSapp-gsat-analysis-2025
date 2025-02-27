//
//  NewVersionView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/27.
//



import SwiftUI
struct NewVersionView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject var data: UserData
    // StateObject
    // Binding
    // State
    // --------------- //
    
    var body: some View {
        
        ScrollView {
            
            HStack{
                
                Image("clearlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                VStack(alignment: .leading){
                    Text("學測個申分析系統")
                        .font(.title)
                        .bold()
                    Text("已更新至版本 \(LevelConstants.programVersion)")
                        .font(.title2)
                }
                
            }
            .padding(.vertical)
            
            VStack(spacing: 10){
                
                HStack {
                    Text("新功能")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                
                VStack() {
                    
                    HStack{
                        Text("付費用戶，這錢值得。")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    Image("Update1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding(.vertical, 10)
                    
                    HStack{
                        Text("現在起，付費用戶除了可享無限次分析次數外，更可在「分析」結果頁編輯各分析結果的名稱，讓各個結果更好辨識。想要記住朋友的成績？完全沒問題。")
                        Spacer()
                    }
                }
                .padding(10)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
                VStack() {
                    
                    HStack{
                        Text("錯誤修正")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack{
                        Text("經用戶反饋發現，在分析結果點擊「加入最愛」按鈕後，會退出當前視窗。此問題已被解決。")
                        Spacer()
                    }
                }
                .padding(10)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
                VStack() {
                    
                    HStack{
                        Text("功能提示")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    Image("Update2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.vertical, 10)
                    
                    HStack{
                        Text("還不知道要如何把科系加入最愛清單嗎？只要在科系清單長按目標校系，即可跳出選單：「加入最愛」或「分享」。")
                        Spacer()
                    }
                }
                .padding(10)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
            }
            .padding()
            
            HStack {
                Button(role: .none){
                    data.usingVersion = LevelConstants.programVersion
                } label: {
                    Spacer()
                    Text("進入程式")
                    Spacer()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
        }
        .padding()
        
    }
    
}

#Preview {
    NewVersionView()
        .environmentObject(UserData())
}
