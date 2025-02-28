//
//  AboutView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/8.
//

import SwiftUI
import GoogleMobileAds

struct AboutView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject var data: UserData
    @EnvironmentObject var favData: UserFavData
    @EnvironmentObject var deptList: DeptDataModel
    @EnvironmentObject var databaseInfo: DatabaseInfo
    // StateObject
    // Binding
    @Binding var selectedTab: Int
    // State
    @State var searchText: String = ""
    @State private var editingDisplayMore: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    @State var favoriteDept: [deptListModel] = []
    @State private var rewardAd: RewardedAd?
    @State private var isAdLoaded = false
    @State private var adLoadMessage = ""
    @State private var isShowNoAdShowView = false
    @State private var isShowBuyProView = false
    // --------------- //
    
    func loadRewardedAd() {
        let adUnitID = "ca-app-pub-4733744894615858/3395180481"
        RewardedAd.load(with: adUnitID, request: Request()) { ad, error in
          if let error = error {
            print("Failed to load rewarded ad: \(error.localizedDescription)")
            adLoadMessage = error.localizedDescription
            isAdLoaded = false
          } else {
            rewardAd = ad
            isAdLoaded = true
          }
        }
      }

    func showRewardedAd() {
        if let ad = rewardAd {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                ad.present(from: rootViewController) {
                    data.analyzeCount += 1
                    loadRewardedAd()
                }
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                HStack{
                    Text("關於")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                
                ScrollView {
                    
                    HStack{
                        Text("資訊")
                            .padding(.vertical, 1)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(5)
                    
                    VStack{
                        HStack{
                            Text("用戶類型")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            if data.userpurchased {
                                Text("付費")
                            } else {
                                Text("一般")
                            }
                            
                        }
                        .padding(5)
                        
                            
                        if !data.userpurchased {
                            
                            HStack{
                                Text("購買付費方案，享無限分析次數及更多功能")
                                Spacer()
                                Button(role: .none){
                                    isShowBuyProView = true
                                } label: {
                                    Text("查看")
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            .padding(10)
                            .background(Color(.secondarySystemGroupedBackground).opacity(0.5))
                            .cornerRadius(10)
                            
                        }
                        
                        Divider()
                        
                        HStack{
                            Text("分析次數")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            Text("剩餘")
                                .foregroundColor(Color(.systemGray2))
                            
                            Text("\(data.analyzeCount)")
                            
                            Text("次")
                                .foregroundColor(Color(.systemGray2))
                            
                        }
                        .padding(5)
                        
                        if !data.userpurchased {
                            
                            HStack{
                                Text("可透過觀看廣告來獲得分析次數")
                                Spacer()
                                
                                if (databaseInfo.adMessage.contains("FORCEMYAD") || !isAdLoaded) {
                                    Button(role: .none){
                                        isShowNoAdShowView = true
                                    } label: {
                                        Text("觀看")
                                    }
                                    .buttonStyle(.borderedProminent)
                                } else {
                                    Button(role: .none){
                                        showRewardedAd()
                                    } label: {
                                        Text("觀看")
                                    }
                                    .disabled(!isAdLoaded)
                                    .buttonStyle(.borderedProminent)
                                }
                                
                            }
                            .padding(10)
                            .background(Color(.secondarySystemGroupedBackground).opacity(0.5))
                            .cornerRadius(10)
                            
                        }
                        
                        Divider()
                        
                        HStack{
                            Text("資料版本")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            Text("\(databaseInfo.version)")
                            
                        }
                        .padding(5)
                        
                        Divider()
                        
                        HStack{
                            Text("程式版本")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            Text("\(LevelConstants.programVersion)")
                            
                        }
                        .padding(5)
                        
                    }
                    .padding(10)
                    .background(Color(.quaternarySystemFill))
                    .cornerRadius(10)
                    
                    HStack{
                        Text("功能")
                            .padding(.vertical, 1)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(5)
                    
                    VStack {
                        
                        NavigationLink(destination: DeptListView(deptList: favoriteDept, title: "最愛科系", displayMore: false, gradeData: gradeData(gradeCH: 11, gradeEN: 14, gradeMA: 7, gradeMB: 11, gradeSC: 12, gradeSO: 11, gradeEL: 1, gradePC: 3, gradePP: 3, gradeSK1: 1, gradeSK2: 0, gradeSK3: 0, gradeSK4: 0, gradeSK5: 0, gradeSKT: 0))){
                            
                            HStack{
                                
                                Spacer()
                                
                                Text("最愛科系")
                                    .foregroundStyle(Color.accentColor)
                                
                                Spacer()
                                
                            }
                            .padding(5)
                            
                        }
                        
                        Divider()
                        
                        NavigationLink(destination: ChoiceView()){
                            HStack{
                                
                                Spacer()
                                
                                Text("志願列表")
                                    .foregroundStyle(Color.accentColor)
                                
                                Spacer()
                                
                            }
                            .padding(5)
                        }
                        
                        Divider()
                        
                        NavigationLink(destination: FirstInfoView()){
                            HStack{
                                
                                Spacer()
                                
                                Text("程式說明、使用條款與作者聯絡方式")
                                    .foregroundStyle(Color.accentColor)
                                
                                Spacer()
                                
                            }
                            .padding(5)
                        }
                        
                    }
                    .padding(10)
                    .background(Color(.quaternarySystemFill))
                    .cornerRadius(10)
                    
                    
                    HStack{
                        Text("重置")
                            .padding(.vertical, 1)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(5)
                    
                    VStack{
                        HStack{
                            
                            Button(role: .destructive, action: {
                                showDeleteConfirmation = true
                            }, label: {
                                Spacer()
                                Text("清除所有資料")
                                Spacer()
                            })
                            .padding(5)
                            
                        }
                    }
                    .padding(10)
                    .background(Color(.quaternarySystemFill))
                    .cornerRadius(10)
                    
                    BannerAdView()
                        .frame(height: 80)
                    
                    Text("\(adLoadMessage)")
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray6))
                    
                }
                
            }
            .padding()
            .confirmationDialog("確定要清除所有資料嗎？", isPresented: $showDeleteConfirmation, titleVisibility: .visible) {
                
                Button("確認刪除", role: .destructive){
                    data.resetUserDefaults()
                    selectedTab = 0
                }
                Button("取消", role: .cancel){
                    // Cancel
                }
                
            } message: {
                Text("此操作會刪除您的成績資料、分析結果以及最愛科系等。\n清除後將返回主畫面，部分內容需要重新啟動程式才會生效。")
            }
            
        }
        .onAppear {
            favoriteDept = deptList.departments.filter { dept in
                favData.favoriteDept.contains(dept.id)
            }
            loadRewardedAd()
        }
        .sheet(isPresented: $isShowNoAdShowView) {
            NoAdShowView()
        }
        .sheet(isPresented: $isShowBuyProView) {
            BuyProView()
        }
        
    }
}
