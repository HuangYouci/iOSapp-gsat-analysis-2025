//
//  FirstInfoView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/19.
//

import SwiftUI
import WebKit

struct FirstInfoView: View {
    
    // --------------- //
    // EnvironmentObject
    @EnvironmentObject var data: UserData
    // StateObject
    // Binding
    // State
    @State private var page: Int = 0
    @State private var offset: CGFloat = 0
    @State private var webUrlToShow: URL? = nil
    // --------------- //
    
    var body: some View {
        VStack{
            switch page {
            case 0:
                VStack(alignment: .leading, spacing: 0){
                    Text("歡迎使用")
                        .font(.largeTitle)
                        .bold()
                    Text("學測個申分析系統")
                        .font(.largeTitle)
                        .bold()
                    Text("學測成績分析、科系資料詳情")
                        .font(.title3)
                        .foregroundStyle(Color(.systemGray2))
                        .padding(.top, 10)
                    Text("針對台灣高中生個人申請升大學製作")
                        .font(.title3)
                        .foregroundStyle(Color(.systemGray2))
                    Spacer()
                    HStack{
                        Spacer()
                        Image("clearlogo")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.4)
                            .offset(x: 120)
                            .rotationEffect(.init(degrees: 5))
                    }
                    HStack{
                        Spacer()
                    }
                }
                .padding()
            case 1:
                VStack(alignment: .leading, spacing: 0){
                    Text("重點功能")
                        .font(.title)
                        .bold()
                    Text("學測成績分析、科系資料詳情")
                        .font(.title3)
                        .foregroundStyle(Color(.systemGray2))
                        .padding(.vertical, 10)
                        .padding(.bottom, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            VStack{
                                HStack{
                                    Text("輕鬆輸入成績資料，\n快速分析。")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Image("Info1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 250)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            VStack{
                                HStack{
                                    Text("過去、現在、未來的所有分析，\n一覽無遺。")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Image("Info2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 250)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            VStack{
                                HStack{
                                    Text("五星級評等校系落點分析，\n實在清晰。")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Image("Info3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 250)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            VStack{
                                HStack{
                                    Text("以關鍵字鎖定，\n喜愛校系。")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Image("Info4")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 250)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            VStack{
                                HStack{
                                    Text("校系詳細資訊：名額、篩選、甄試，\n盡收眼底。")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Image("Info5")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 250)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            VStack{
                                HStack{
                                    Text("找到喜歡校系？成為最愛，\n堅定不移。")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Image("Info6")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 250)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.trailing, 50)
                        }
                    }
                    .padding(.trailing, -50)
                    Spacer()
                }
                .padding()
            case 2:
                VStack(alignment: .leading, spacing: 0){
                    
                    Text("關於本程式")
                        .font(.title)
                        .bold()
                    Text("學測個申分析系統")
                        .font(.title3)
                        .foregroundStyle(Color(.systemGray2))
                        .padding(.vertical, 10)
                        .padding(.bottom, 10)
                    
                    VStack{
                        VStack{
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(.bottom, 10)
                            
                            Text("學測個申分析系統")
                                .bold()
                            
                            Text("由 YC 開發")
                            
                            Text("ycdev@icloud.com")
                            
                        }
                        .padding(10)
                        
                        Divider()
                        
                        HStack{
                            
                            Text("程式版本")
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Text("\(LevelConstants.programVersion)")
                            
                        }
                        .padding(5)
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(10)
                    
                    VStack{
                        Button(role: .none){
                            webUrlToShow = URL(string: "https://huangyouci.github.io/app/eula/")
                        } label: {
                            HStack{
                                Text("使用條款")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color(.systemGray2))
                            }
                        }
                        Divider()
                            .padding(.vertical, 5)
                        Button(role: .none){
                            webUrlToShow = URL(string: "https://huangyouci.github.io/app/privacypolicy/")
                        } label: {
                            HStack{
                                Text("隱私政策")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color(.systemGray2))
                            }
                        }
                    }
                    .padding(15)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(10)
                    
                    Spacer()
                }
                .padding()
            case 3:
                VStack(alignment: .leading, spacing: 0){
                    Text("歡迎使用")
                        .font(.title)
                        .bold()
                    Text("祝金榜題名、夢想成真！")
                        .font(.title3)
                        .foregroundStyle(Color(.systemGray2))
                        .padding(.vertical, 10)
                    Text("請注意，分析結果僅供參考，志願選填前請再三思考、謹慎比對。校系資料來自於教育部開放平台，最終資訊仍以官方公布為主。")
                        .font(.title3)
                    Spacer()
                    if !data.notFirstUse {
                        HStack {
                            Button(role: .none){
                                data.usingVersion = LevelConstants.programVersion
                                data.notFirstUse = true
                            } label: {
                                Spacer()
                                Text("開始使用")
                                Spacer()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    }
                    HStack{
                        Spacer()
                    }
                }
                .padding()
            default:
                VStack{
                    Color.clear
                    Text("錯誤的頁面")
                    Text("請點選畫面任意處來返回")
                    Color.clear
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    page = 0
                }
            }
            HStack{
                Circle()
                    .fill(page == 0 ? Color(.systemGray2) : Color(.systemGray5))
                    .frame(width: page == 0 ? 10 : 8, height: page == 0 ? 10 : 8)
                Circle()
                    .fill(page == 1 ? Color(.systemGray2) : Color(.systemGray5))
                    .frame(width: page == 1 ? 10 : 8, height: page == 1 ? 10 : 8)
                Circle()
                    .fill(page == 2 ? Color(.systemGray2) : Color(.systemGray5))
                    .frame(width: page == 2 ? 10 : 8, height: page == 2 ? 10 : 8)
                Circle()
                    .fill(page == 3 ? Color(.systemGray2) : Color(.systemGray5))
                    .frame(width: page == 3 ? 10 : 8, height: page == 3 ? 10 : 8)
            }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    // 滑動時即時更新偏移量
                    offset = value.translation.width
                }
                .onEnded { value in
                    // 滑動結束時判斷方向
                    if value.translation.width < -50 { // 從右往左滑，下一頁
                        withAnimation(.easeInOut) {
                            if page < 3 { // 確保不低於第1頁
                                page += 1
                            }
                            offset = 0 // 重置偏移量
                        }
                    } else if value.translation.width > 50 { // 從左往右滑，上一頁
                        withAnimation(.easeInOut) {
                            if page > 0 { // 確保不低於第1頁
                                page -= 1
                            }
                            offset = 0 // 重置偏移量
                        }
                    } else {
                        // 如果滑動距離不夠，回到原位
                        withAnimation(.easeInOut) {
                            offset = 0
                        }
                    }
                }
        )
        .sheet(item: $webUrlToShow) { url in
            VStack(spacing: 0) {
                HStack(alignment: .center){
                    Spacer()
                    Text(url.host ?? "")
                    Spacer()
                    Button(role: .none){
                        webUrlToShow = nil
                    } label: {
                        Text("完成")
                    }
                    .buttonStyle(.plain)
                }
                .foregroundStyle(Color(.label))
                .padding(15)
                .background(Color(.systemBackground).opacity(0.8))
                
                WebView(url: url)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if uiView.url != url {
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            uiView.load(request)
        }
    }
}

#Preview {
    FirstInfoView()
        .environmentObject(UserData())
}
