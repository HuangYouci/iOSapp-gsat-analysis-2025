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
                        Text("深思熟慮，再選擇")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    Image("Update1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.vertical, 10)
                    
                    HStack{
                        Text("新功能！現在長按目標科系，除了可以將其加入「最愛清單」外，更可加入「志願清單」。")
                        Spacer()
                    }
                }
                .padding(10)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
                VStack() {
                    
                    HStack{
                        Text("志願序，清楚明瞭")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    Image("Update2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding(.vertical, 10)
                    
                    HStack{
                        Text("志願清單鎖定僅能填寫六個校系，幫助您更好鎖定志願序。我們推薦用戶可以先加入最愛清單，和老師、同學討論後再從最愛清單選擇六志願加入。也可直接截圖六志願清單和朋友分享。")
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
