import SwiftUI

struct ContentView: View {
    // --------------- //
    // EnvironmentObject
    // StateObject
    @EnvironmentObject private var data: UserDef
    @EnvironmentObject private var deptList: DeptDataModel
    @EnvironmentObject private var databaseInfo: DatabaseInfo
    // Binding
    // State
    @State private var selectedTab = 0
    // --------------- //
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("首頁")
                }
                .tag(0)
            
            ResultListView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "chart.line.text.clipboard")
                    Text("分析")
                }
                .tag(1)
            
            ListView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("清單")
                }
                .tag(3)
            
            AboutView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "person")
                    Text("關於")
                }
                .tag(2)
        }
        .onAppear {
            Task {
                // 先檢查初始化狀態
                print("正在檢查 IAP 狀態...")
                if IAPManager.shared.products.isEmpty {
                    print("等待商品載入...")
                    await IAPManager.shared.fetchProducts()
                }
                
                if let errorMessage = IAPManager.shared.errorMessage {
                    print("IAP 錯誤: \(errorMessage)")
                }
                
                if IAPManager.shared.isPurchased("myProject01_userpurchased") {
                    print("檢測到已購買狀態")
                    await MainActor.run {
                        data.userpurchased = true
                        data.analyzeCount = 2415919104
                    }
                } else {
                    print("未檢測到購買狀態")
                }
                
                await loadURLData(databaseInfo: databaseInfo)
            }
        }
    }
}
