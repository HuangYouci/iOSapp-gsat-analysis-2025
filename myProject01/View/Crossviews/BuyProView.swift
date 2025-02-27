//
//  BuyProView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/27.
//

import SwiftUI

struct BuyProView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject var data: UserData
    // StateObject
    // Binding
    // State
    @State private var showPurchaseError = false
    @State private var purchaseErrorMessage = ""
    @State private var bought = false
    // --------------- //
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Image("clearlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                VStack(alignment: .leading){
                    Text("學測個申分析系統")
                        .font(.title)
                        .bold()
                    Text("購買付費用戶方案")
                        .font(.title2)
                }
                
            }
            .padding(.top, 40)
            
            ScrollView {
                
                VStack(spacing: 10){
                    
                    HStack {
                        Text("付費用戶專屬功能")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    
                    VStack() {
                        
                        HStack{
                            Text("🔍 無限次分析次數")
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        
                        HStack{
                            Text("付費用戶可獲得無限次的分析次數，助你以各種分數可能分析各種資料結果。亦可分析他人的資料，知己知彼、百戰百勝！")
                            Spacer()
                        }
                    }
                    .padding(10)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                    
                    VStack() {
                        
                        HStack{
                            Text("✏️ 編輯結果名稱")
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        
                        HStack{
                            Text("付費用戶可以建立無限個分析結果，為了讓分析結果更易辨識，付費用戶可以編輯個別分析結果的名稱！將他們加上標籤，以後再也不忘記。")
                            Spacer()
                        }
                    }
                    .padding(10)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                    
                    VStack() {
                        
                        HStack{
                            Text("❤️ 滿滿的支持")
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        
                        HStack{
                            Text("給予開發者支持，我感謝你。")
                            Spacer()
                        }
                    }
                    .padding(10)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                    
                }
                .padding()
                
            }
            .padding()
            
            Button {
                
                Task {
                    guard let product = IAPManager.shared.product(for: "myProject01_userpurchased") else {
                        purchaseErrorMessage = "商品未載入"
                        showPurchaseError = true
                        return
                    }
                    
                    do {
                        try await IAPManager.shared.purchase(product)
                        await MainActor.run {
                            data.userpurchased = true
                            data.analyzeCount = 2415919104
                            bought = true
                        }
                    } catch {
                        await MainActor.run {
                            purchaseErrorMessage = error.localizedDescription
                            showPurchaseError = true
                        }
                    }
                    
                }
                
            } label: {
                HStack{
                    Spacer()
                    Text(bought ? "已購買" : "購買")
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .cornerRadius(30)
            .padding(.horizontal, 50)
            .disabled(bought)
        }
        .alert("購買失敗", isPresented: $showPurchaseError) {
                Button("確定", role: .cancel) { }
            } message: {
                Text(purchaseErrorMessage)
        }
    }
}

#Preview {
    BuyProView()
}
