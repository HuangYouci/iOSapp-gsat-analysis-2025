//
//  deptListFunc.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/9.
//

import Foundation

/// 本 Class 用於單一科系的資料分析

class deptListFunc {
    
    var data: gradeData
    
    init(data: gradeData) {
        self.data = data
    }
    
    /// 分數轉換五標
    /// 傳入科目名稱與使用者科目等級，傳出字串
    
    static func getFiveStandard(for subject: String, grade: Int) -> String {
        switch subject {
        case "CH":
            if grade >= LevelConstants.CHLevel1 {
                return "頂標"
            } else if grade >= LevelConstants.CHLevel2 {
                return "前標"
            } else if grade >= LevelConstants.CHLevel3 {
                return "均標"
            } else if grade >= LevelConstants.CHLevel4 {
                return "後標"
            } else if grade >= LevelConstants.CHLevel5 {
                return "底標"
            } else {
                return "流標"
            }
        case "EN":
            if grade >= LevelConstants.ENLevel1 {
                return "頂標"
            } else if grade >= LevelConstants.ENLevel2 {
                return "前標"
            } else if grade >= LevelConstants.ENLevel3 {
                return "均標"
            } else if grade >= LevelConstants.ENLevel4 {
                return "後標"
            } else if grade >= LevelConstants.ENLevel5 {
                return "底標"
            } else {
                return "流標"
            }
        case "MA":
            if grade >= LevelConstants.MALevel1 {
                return "頂標"
            } else if grade >= LevelConstants.MALevel2 {
                return "前標"
            } else if grade >= LevelConstants.MALevel3 {
                return "均標"
            } else if grade >= LevelConstants.MALevel4 {
                return "後標"
            } else if grade >= LevelConstants.MALevel5 {
                return "底標"
            } else {
                return "流標"
            }
        case "MB":
            if grade >= LevelConstants.MBLevel1 {
                return "頂標"
            } else if grade >= LevelConstants.MBLevel2 {
                return "前標"
            } else if grade >= LevelConstants.MBLevel3 {
                return "均標"
            } else if grade >= LevelConstants.MBLevel4 {
                return "後標"
            } else if grade >= LevelConstants.MBLevel5 {
                return "底標"
            } else {
                return "流標"
            }
        case "SC":
            if grade >= LevelConstants.SCLevel1 {
                return "頂標"
            } else if grade >= LevelConstants.SCLevel2 {
                return "前標"
            } else if grade >= LevelConstants.SCLevel3 {
                return "均標"
            } else if grade >= LevelConstants.SCLevel4 {
                return "後標"
            } else if grade >= LevelConstants.SCLevel5 {
                return "底標"
            } else {
                return "流標"
            }
        case "SO":
            if grade >= LevelConstants.SOLevel1 {
                return "頂標"
            } else if grade >= LevelConstants.SOLevel2 {
                return "前標"
            } else if grade >= LevelConstants.SOLevel3 {
                return "均標"
            } else if grade >= LevelConstants.SOLevel4 {
                return "後標"
            } else if grade >= LevelConstants.SOLevel5 {
                return "底標"
            } else {
                return "流標"
            }
        default:
            return "--" // 不支援的科目則回傳預設值
        }
    }

    /// 檢查學生是否通過各科篩選標準
    ///
    /// 此函式根據傳入的各科篩選標準（例如：國文、英文、數學等）來判斷學生的成績是否符合要求。
    /// 如果篩選條件中有多科（例如數學和英文），將根據不同的情況進行不同的邏輯判斷：
    /// - 如果同時設定數學（MA）和數學（MB）的篩選標準，只需滿足其中一科即可；
    /// - 如果僅設定其中一科，則需要滿足該科的條件。
    ///
    /// - Parameters:
    ///   - CH: 國文的篩選標準，預設為 "--"，表示不篩選。
    ///   - EN: 英文的篩選標準，預設為 "--"，表示不篩選。
    ///   - MA: 數學 A 的篩選標準，預設為 "--"，表示不篩選。
    ///   - MB: 數學 B 的篩選標準，預設為 "--"，表示不篩選。
    ///   - SC: 自然科學的篩選標準，預設為 "--"，表示不篩選。
    ///   - SO: 社會科學的篩選標準，預設為 "--"，表示不篩選。
    ///   - EL: 英語等級的篩選標準，預設為 "--"，表示不篩選。
    ///   - data: 包含學生各科成績的資料。
    ///   - PC: 政治科學的篩選標準，預設為 "--"，表示不篩選。
    ///   - PP: 心理學的篩選標準，預設為 "--"，表示不篩選。
    /// - Returns:
    ///   - 如果學生的成績符合所有指定的篩選條件，則返回 `true`，否則返回 `false`。
    static func checkTestPassed(CH: String = "--", EN: String = "--", MA: String = "--", MB: String = "--", SC: String = "--", SO: String = "--", EL: String = "--", data: gradeData, PC: String = "--", PP: String = "--") -> Bool {
        
        // 設定對應級分的變數
        var CHLevel = 0
        var ENLevel = 0
        var MALevel = 0
        var MBLevel = 0
        var SCLevel = 0
        var SOLevel = 0
        var ELLevel = 0
        var PCLevel = 0
        var PPLevel = 0
        
        // 根據傳入的標準設定每科的級分
        switch CH {
        case "頂標":
            CHLevel = LevelConstants.CHLevel1
        case "前標":
            CHLevel = LevelConstants.CHLevel2
        case "均標":
            CHLevel = LevelConstants.CHLevel3
        case "後標":
            CHLevel = LevelConstants.CHLevel4
        case "底標":
            CHLevel = LevelConstants.CHLevel5
        default:
            CHLevel = 0 // 代表不篩選
        }
        
        switch EN {
        case "頂標":
            ENLevel = LevelConstants.ENLevel1
        case "前標":
            ENLevel = LevelConstants.ENLevel2
        case "均標":
            ENLevel = LevelConstants.ENLevel3
        case "後標":
            ENLevel = LevelConstants.ENLevel4
        case "底標":
            ENLevel = LevelConstants.ENLevel5
        default:
            ENLevel = 0 // 代表不篩選
        }
        
        switch MA {
        case "頂標":
            MALevel = LevelConstants.MALevel1
        case "前標":
            MALevel = LevelConstants.MALevel2
        case "均標":
            MALevel = LevelConstants.MALevel3
        case "後標":
            MALevel = LevelConstants.MALevel4
        case "底標":
            MALevel = LevelConstants.MALevel5
        default:
            MALevel = 0 // 代表不篩選
        }
        
        switch MB {
        case "頂標":
            MBLevel = LevelConstants.MBLevel1
        case "前標":
            MBLevel = LevelConstants.MBLevel2
        case "均標":
            MBLevel = LevelConstants.MBLevel3
        case "後標":
            MBLevel = LevelConstants.MBLevel4
        case "底標":
            MBLevel = LevelConstants.MBLevel5
        default:
            MBLevel = 0 // 代表不篩選
        }
        
        switch SC {
        case "頂標":
            SCLevel = LevelConstants.SCLevel1
        case "前標":
            SCLevel = LevelConstants.SCLevel2
        case "均標":
            SCLevel = LevelConstants.SCLevel3
        case "後標":
            SCLevel = LevelConstants.SCLevel4
        case "底標":
            SCLevel = LevelConstants.SCLevel5
        default:
            SCLevel = 0 // 代表不篩選
        }
        
        switch SO {
        case "頂標":
            SOLevel = LevelConstants.SOLevel1
        case "前標":
            SOLevel = LevelConstants.SOLevel2
        case "均標":
            SOLevel = LevelConstants.SOLevel3
        case "後標":
            SOLevel = LevelConstants.SOLevel4
        case "底標":
            SOLevel = LevelConstants.SOLevel5
        default:
            SOLevel = 0 // 代表不篩選
        }
        
        switch EL {
        case "A級":
            ELLevel = 1
        case "B級":
            ELLevel = 2
        case "C級":
            ELLevel = 3
        default:
            ELLevel = 4 // 代表不篩選
        }
            
        switch PC {
        case "5級":
            PCLevel = 5
        case "4級":
            PCLevel = 4
        case "3級":
            PCLevel = 3
        case "2級":
            PCLevel = 2
        case "1級":
            PCLevel = 2
        default:
            PCLevel = 0
        }
            
        switch PP {
        case "5級":
            PPLevel = 5
        case "4級":
            PPLevel = 4
        case "3級":
            PPLevel = 3
        case "2級":
            PPLevel = 2
        case "1級":
            PPLevel = 2
        default:
            PPLevel = 0
        }
        
        // 判斷是否有設定 MA 和 MB 的篩選標準
        let hasMAFilter = MA != "--"
        let hasMBFilter = MB != "--"

        let MA_MB_Passed: Bool
        if hasMAFilter && hasMBFilter {
            // 同時有 MA 和 MB 的篩選標準 -> 只要其中一科達標即可
            MA_MB_Passed = (data.gradeMA >= MALevel || data.gradeMB >= MBLevel)
        } else if hasMAFilter {
            // 只有 MA 需要篩選 -> 需滿足 MA
            MA_MB_Passed = (data.gradeMA >= MALevel)
        } else if hasMBFilter {
            // 只有 MB 需要篩選 -> 需滿足 MB
            MA_MB_Passed = (data.gradeMB >= MBLevel)
        } else {
            // 沒有 MA 或 MB 的篩選標準，直接通過
            MA_MB_Passed = true
        }
        
        // 最終判斷是否通過篩選標準
        return (data.gradeCH >= CHLevel && data.gradeEN >= ENLevel &&
                MA_MB_Passed &&
                data.gradeSC >= SCLevel && data.gradeSO >= SOLevel &&
                data.gradeEL <= ELLevel && data.gradePC >= PCLevel &&
                data.gradePP >= PPLevel)
    }

    
    /// 篩選名稱排序
    /// 傳入所有篩選倍率的科目名稱，傳出排序後的字串
    
    static func sortSubjectsNames(CH: String, EN: String, MA: String, MB: String, SC: String, SO: String, multiple: String, PC: String, PP: String) -> [String] {
        let subjectNames: [String: String] = [
            "CH": "國文", "EN": "英文", "MA": "數Ａ", "MB": "數Ｂ",
            "SC": "自然", "SO": "社會", "multiple": "組合科目", "PC": "程式設計觀念", "PP": "程式設計實作"
        ]
        
        let scores: [String: Double] = [
            "CH": Double(CH) ?? (CH == "--" ? 0 : 0),
            "EN": Double(EN) ?? (EN == "--" ? 0 : 0),
            "MA": Double(MA) ?? (MA == "--" ? 0 : 0),
            "MB": Double(MB) ?? (MB == "--" ? 0 : 0),
            "SC": Double(SC) ?? (SC == "--" ? 0 : 0),
            "SO": Double(SO) ?? (SO == "--" ? 0 : 0),
            "multiple": Double(multiple) ?? (multiple == "--" ? 0 : 0),
            "PC": Double(PC) ?? (PC.isEmpty ? 0 : 0),
            "PP": Double(PP) ?? (PP.isEmpty ? 0 : 0)
        ]
        
        let sortedScores = scores.filter { $0.value > 0 }.sorted { $0.value > $1.value }
        
        var result: [String] = []
        var lastScore: Double? = nil
        var group: [String] = []
        
        for (subject, score) in sortedScores {
            if let last = lastScore, last == score {
                group.append(subjectNames[subject] ?? subject)
            } else {
                if !group.isEmpty {
                    result.append(group.joined(separator: "、"))
                }
                group = [subjectNames[subject] ?? subject]
            }
            lastScore = score
        }
        
        if !group.isEmpty {
            result.append(group.joined(separator: "、"))
        }
        
        return result
    }
    
    /// 篩選倍率排序
    /// 傳入所有篩選倍率的科目倍率，傳出排序後的數串
    
    static func sortSubjectsScores(
        CH: String, EN: String, MA: String, MB: String, SC: String, SO: String,
        multiple: String, PC: String, PP: String
    ) -> [Double] {
        
        // 先逐步轉換字串為 Double，確保每一步都明確
        let convertedScores: [Double] = [
            Double(CH) ?? 0.0,
            Double(EN) ?? 0.0,
            Double(MA) ?? 0.0,
            Double(MB) ?? 0.0,
            Double(SC) ?? 0.0,
            Double(SO) ?? 0.0,
            Double(multiple) ?? 0.0,
            Double(PC) ?? 0.0,
            Double(PP) ?? 0.0
        ]
        
        // 過濾掉 0，轉換成 Set 來去除重複，最後進行排序
        let filteredScores = convertedScores.filter { $0 > 0 }
        let uniqueSortedScores = Array(Set(filteredScores)).sorted(by: >)
        
        return uniqueSortedScores
    }
    
    /// 轉換篩選結果
    /// 傳入篩選資料，以「科目+科目=分數、科目=分數、有/--」或是「無資料」的方式傳入
    
    static func parseTestResult(_ result: String, outputType: Int = 0) -> [String] {
            if result == "無資料" { return ["無資料"] }
            return result
                .replacingOccurrences(of: "--", with: "超額篩選=無")
                .replacingOccurrences(of: "有", with: "超額篩選=有")
                .replacingOccurrences(of: "國", with: "國文")
                .replacingOccurrences(of: "英", with: "英文")
                .replacingOccurrences(of: "自", with: "自然")
                .replacingOccurrences(of: "社", with: "社會")
                .split(separator: "、")
                .map { value in
                    let parts = value.split(separator: "=", maxSplits: 1).map { String($0) }
                    return parts.indices.contains(outputType) ? parts[outputType] : ""
                }
        }
    
    /// 套用篩選結果用戶資料
    
    static func convertSubjects(_ subjects: [String], gradeData: gradeData) -> [Int] {
        
        let mapping: [String: Int] = [
            "國文": gradeData.gradeCH,
            "英文": gradeData.gradeEN,
            "數A": gradeData.gradeMA,
            "數B": gradeData.gradeMB,
            "自然": gradeData.gradeSC,
            "社會": gradeData.gradeSO,
            "超額篩選": 0
        ]
        
        if subjects == ["無資料"] {
            return [0]
        }
        
        return subjects.map { subject in
                let values = subject.split(separator: "+")
                    .compactMap { mapping[String($0)] }
                
                return values.count > 1 ? values.reduce(0, +) : values.first ?? 0
        }
        
    }

    
    /// 落點分析
    /// 演算法
    /// 傳入篩選結果和使用者資料 Data()
    
    static func calPassChance(testResult: String = "--", data: gradeData) -> Double {
        
        if testResult == "無資料" { return 0.00 }
        
        let parseTestResult = zip(parseTestResult(testResult, outputType: 0), parseTestResult(testResult, outputType: 1))
        
        var chance: Double = 0.5
        var calDiff: Int = 0
        var calSubCount: Int = 0
        var calDiffDivSubCount: Double = 0
        
        for (subject, value) in parseTestResult {
            
            if chance > 0.5 { chance = 0.5+((chance - 0.5)*0.7) }
            
            /// 如果有下回合就讓上回合的影響變小
            /// 只有當：chance > 0.5 時，才和 50% 的差距的 70%
            
            calDiff = 0
            calSubCount = 0
            
            for (subsubject) in subject.split(separator: "+") {
                
                calSubCount += 1
                
                switch subsubject {
                case "國文":
                    calDiff += data.gradeCH
                case "英文":
                    calDiff += data.gradeEN
                case "數A":
                    calDiff += data.gradeMA
                case "數B":
                    calDiff += data.gradeMB
                case "自然":
                    calDiff += data.gradeSC
                case "社會":
                    calDiff += data.gradeSO
                default:
                    calDiff += 0
                }
                
            }
            
            if (calDiff == (calSubCount * 15)) { chance *= 1.9 }
            
            /// 在此 calDiff 還沒扣掉結果分數，是使用者原本的分數
            /// 如果使用者原本分數是滿級分，則機率直接 +90%
            
            calDiff -= ( Int(value) ?? 0 )
            
            /// calDiff 為 某一科目組合 使用者與去年結果的差距 (正為使用者多)
            /// 正越多越有利
            
            /// times 是該科的採計倍數
            /// 倍數越多越有利（倍數先不實作）
            
            calDiffDivSubCount = Double(calDiff) / Double(calSubCount)
            calDiffDivSubCount *= (1 + 0.7 * Double(calSubCount)) // 暫時的
            
            /// chance 機率實作
            /// calDiffDivSubCount 是 平均每科目差級分
            
            switch calDiffDivSubCount {
            case 5...:
                chance *= 1.60 // +60%
            case 4..<5:
                chance *= 1.50 // +50%
            case 3..<4:
                chance *= 1.30  // +30%
            case 2..<3:
                chance *= 1.15  // +15%
            case 1..<2:
                chance *= 1.10  // +10%
            case 0.5..<1:
                chance *= 1.05  // +5%
            case -0.5..<0.5:
                break  // +0% (不變)
            case -1..<(-0.5):
                chance *= 0.95  // -5%
            case -2..<(-1):
                chance *= 0.90  // -10%
            case -3..<(-2):
                chance *= 0.85  // -15%
            case -4..<(-3):
                chance *= 0.70 // -30%
            case -5..<(-4):
                chance *= 0.50 // -50%
            default:
                chance *= 0.40  // -60%
            }
            
            // print("計算 \(subject) 科之後的機率是 \(chance)")
            
        }
        
        if chance > 1 { return 1.00 }
        if chance <= 0 { return 0.01 }
        
        return chance
    }
    
      
}
