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
                    Text("學測個申分析")
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
                        Text("全新設計，耀眼登場")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
//                    Image("Update1")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 200)
//                        .padding(.vertical, 10)
                    
                    HStack{
                        Text("本程式的版面做了全新設計，希望給您更好的使用體驗！")
                        Spacer()
                    }
                }
                .padding(10)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
                VStack() {
                    
                    HStack{
                        Text("學測倒數計時")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    HStack{
                        Text("現在在應用程式主畫面可看到距離下一次學測考試的倒數。")
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
