//
//  NoAdToShow.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/25.
//

import SwiftUI

struct NoAdShowView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject var data: UserData
    @EnvironmentObject private var databaseInfo: DatabaseInfo
    // StateObject
    // Binding
    // State
    @State private var isAdCompleted: Bool = false
    @State private var remainingSeconds: Int = 30
    @State private var timer: Timer? = nil
    // --------------- //
    
    var body: some View {
        VStack {
            
            HStack{
                Text("廣告")
                    .font(.title)
                    .bold()
                Spacer()
            }
            
            HStack{
                if isAdCompleted {
                    Text("廣告觀看完成，分析次數已新增！您可關閉本頁面。")
                        .foregroundStyle(Color(.green))
                } else {
                    Text("剩餘 \(remainingSeconds) 秒")
                }
                Spacer()
            }
            
            ScrollView {
                HStack{
                    Text(databaseInfo.adMessage)
                    Spacer()
                }
            }
            
        }
        .padding()
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
        // 建立 timer，1 秒更新一次
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                isAdCompleted = true
                data.analyzeCount += 1
                t.invalidate()  // 停止計時器
            }
        }
    }
    
}

#Preview {
    NoAdShowView()
        .environmentObject(DatabaseInfo())
}
