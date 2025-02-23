//
//  loadURLdata.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/23.
//

import SwiftUI

func loadURLData(databaseInfo: DatabaseInfo) async {
    
    // 嘗試載入資料
    do {
        let url = URL(string: "https://huangyouci.github.io/appdata/myProject01.txt")!
        
        // 建立 URLRequest 並設定快取策略
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        // 使用 request 來獲取資料，而不是直接使用 url
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if let content = String(data: data, encoding: .utf8) {
            let dataArray = content.split(separator: ";").map { String($0) }
            
            // 如果資料有足夠的項目
            if dataArray.count >= 7 {
                // 先處理版本資料
                DispatchQueue.main.async {
                    databaseInfo.updateDatabaseVersion(dataArray[0])
                    databaseInfo.updateAnnouncement(dataArray[7])
                }
                
                // 依次處理其他六筆資料
                for i in 1...6 {
                    updateLevelConstants(dataArray[i])
                }
            }
        }
    } catch {
        print("資料讀取錯誤: \(error)")
    }
}

func updateLevelConstants(_ data: String) {
    let validSubjects = ["CH", "EN", "MA", "MB", "SC", "SO"]
    let components = data.split(separator: ":")
    
    guard components.count == 2,
          validSubjects.contains(String(components[0])) else {
        print("updateLevelConstants | Invalid data format")
        return
    }
    
    let subject = String(components[0])
    let scores = components[1].split(separator: ",").map { Int($0) }
    
    guard scores.count == 5, scores.allSatisfy({ $0 != nil }) else {
        print("updateLevelConstants | Invalid scores")
        return
    }
    
    switch subject {
    case "CH":
        LevelConstants.CHLevel1 = scores[0]!
        LevelConstants.CHLevel2 = scores[1]!
        LevelConstants.CHLevel3 = scores[2]!
        LevelConstants.CHLevel4 = scores[3]!
        LevelConstants.CHLevel5 = scores[4]!
        
    case "EN":
        LevelConstants.ENLevel1 = scores[0]!
        LevelConstants.ENLevel2 = scores[1]!
        LevelConstants.ENLevel3 = scores[2]!
        LevelConstants.ENLevel4 = scores[3]!
        LevelConstants.ENLevel5 = scores[4]!
        
    case "MA":
        LevelConstants.MALevel1 = scores[0]!
        LevelConstants.MALevel2 = scores[1]!
        LevelConstants.MALevel3 = scores[2]!
        LevelConstants.MALevel4 = scores[3]!
        LevelConstants.MALevel5 = scores[4]!
        
    case "MB":
        LevelConstants.MBLevel1 = scores[0]!
        LevelConstants.MBLevel2 = scores[1]!
        LevelConstants.MBLevel3 = scores[2]!
        LevelConstants.MBLevel4 = scores[3]!
        LevelConstants.MBLevel5 = scores[4]!
        
    case "SC":
        LevelConstants.SCLevel1 = scores[0]!
        LevelConstants.SCLevel2 = scores[1]!
        LevelConstants.SCLevel3 = scores[2]!
        LevelConstants.SCLevel4 = scores[3]!
        LevelConstants.SCLevel5 = scores[4]!
        
    case "SO":
        LevelConstants.SOLevel1 = scores[0]!
        LevelConstants.SOLevel2 = scores[1]!
        LevelConstants.SOLevel3 = scores[2]!
        LevelConstants.SOLevel4 = scores[3]!
        LevelConstants.SOLevel5 = scores[4]!
        
    default:
        break
    }
}



