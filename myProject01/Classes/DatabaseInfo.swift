//
//  DatabaseInfo.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/23.
//

import SwiftUI

@MainActor
class DatabaseInfo: ObservableObject {
    @Published var version: String
    @Published var announcement: String
    @Published var adMessage: String
    
    // 初始化
    init(version: String = "114年（離線版）",
         announcement: String = "無法連線到資料庫，目前五標為 114 年資料。請確保連上網路，嘗試重新載入或更新 App。如果狀況持續，請聯絡開發者。",
         adMessage: String = "null")
    {
        self.version = version
        self.announcement = announcement
        self.adMessage = adMessage
    }
    
    func updateDatabaseVersion(_ versionString: String) {
        let components = versionString.split(separator: ":")
        
        if components.count == 2 {
            // 取得公告並去除多餘的空白字符
            let version = components[1].trimmingCharacters(in: .whitespaces)
            DispatchQueue.main.async {
                self.version = version
            }
            print("updateAnnouncement | 版本已更新為：\(version)")
        } else {
            // 如果無法解析公告，顯示錯誤訊息
            print("updateAnnouncement | 無法解析版本")
        }
    }

    func updateAnnouncement(_ string: String) {
        // 檢查字串中是否包含 ":"
        let components = string.split(separator: ":")
        
        if components.count == 2 {
            // 取得公告並去除多餘的空白字符
            let announcement = components[1].trimmingCharacters(in: .whitespaces)
            DispatchQueue.main.async {
                self.announcement = announcement
            }
            print("updateAnnouncement | 公告已更新為：\(announcement)")
        } else {
            // 如果無法解析公告，顯示錯誤訊息
            print("updateAnnouncement | 無法解析公告")
        }
    }
    
    func updateAdMessage(_ string: String) {
        // 檢查字串中是否包含 ":"
        let components = string.split(separator: ":")
        
        if components.count == 2 {
            // 取得公告並去除多餘的空白字符
            let adMessage = components[1].trimmingCharacters(in: .whitespaces)
            DispatchQueue.main.async {
                self.adMessage = adMessage
            }
            print("updateAdMessage | 廣告已更新為：\(adMessage)")
        } else {
            // 如果無法解析公告，顯示錯誤訊息
            print("updateAdMessage | 無法解析廣告")
        }
    }
}
