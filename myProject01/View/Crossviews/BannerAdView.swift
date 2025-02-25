//
//  BannerAdView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/25.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdView: UIViewRepresentable {
    private let adUnitID: String = "ca-app-pub-4733744894615858/5294331924"
    @State private var adLoaded = false
    
    // Coordinator 來處理 delegate
    class Coordinator: NSObject, BannerViewDelegate {
        var parent: BannerAdView
        
        init(_ parent: BannerAdView) {
            self.parent = parent
        }
        
        func bannerViewDidReceiveAd(_ bannerView: BannerView) {
            parent.adLoaded = true
            print("廣告載入成功")
        }
        
        func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
            parent.adLoaded = false
            print("廣告載入失敗: \(error.localizedDescription)")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> BannerView {
        let banner = BannerView(adSize: AdSizeBanner) // 或使用 kGADAdSizeBanner
        
        // 設置廣告單元 ID 和 delegate
        banner.adUnitID = adUnitID
        banner.delegate = context.coordinator
        
        // 更安全的 rootViewController 獲取
        banner.rootViewController = getRootViewController()
        
        // 配置自適應大小
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let frame = windowScene.windows.first?.frame ?? UIScreen.main.bounds
            banner.adSize = currentOrientationAnchoredAdaptiveBanner(width: frame.width)
        }
        
        // 載入廣告
        banner.load(Request())
        
        return banner
    }
    
    func updateUIView(_ uiView: BannerView, context: Context) {
        // 如果需要更新，可以在這裡處理
        if !adLoaded {
            uiView.load(Request())
        }
    }
    
    // 獲取 rootViewController 的輔助方法
    private func getRootViewController() -> UIViewController? {
        // 獲取當前活躍的 windowScene
        if let windowScene = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .compactMap({ $0 as? UIWindowScene })
            .first {
            // 從該 windowScene 中獲取第一個 window 的 rootViewController
            return windowScene.windows.first?.rootViewController
        }
        
        // 備用方案：如果沒有活躍的 scene，嘗試獲取任意第一個 windowScene
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first {
            return windowScene.windows.first?.rootViewController
        }
        
        // 最終備用方案，返回 nil
        return nil
    }
}
