//
//  UserFavData.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/27.
//

import SwiftUI

class UserFavData: ObservableObject {
    
    @Published var favoriteDept: [String] {
        didSet {
            UserDefaults.standard.set(favoriteDept, forKey: "favoriteDept")
        }
    }
    
    @Published var choiceDept: [String] {
        didSet {
            UserDefaults.standard.set(choiceDept, forKey: "choiceDept")
        }
    }
    
    @Published var gradeNames: [String: String] { // [UUID字串: 名稱]
        didSet {
            UserDefaults.standard.set(gradeNames, forKey: "gradeNames")
        }
    }
    
    init(){
        self.favoriteDept = UserDefaults.standard.array(forKey: "favoriteDept") as? [String] ?? []
        self.choiceDept = UserDefaults.standard.array(forKey: "choiceDept") as? [String] ?? []
        self.gradeNames = UserDefaults.standard.dictionary(forKey: "gradeNames") as? [String: String] ?? [:]
    }
    
    func setGradeName(for grade: gradeData, name: String) { // 修改為使用 GradeData
        gradeNames[grade.id.uuidString] = name
        print("UserFavData| \(grade) (\(grade.id)) 已被變更為 \(name)")
    }

    func getGradeName(for grade: gradeData) -> String? { // 已正確
        print("UserFavData| \(grade) (\(grade.id)) 取得名稱為 \(gradeNames[grade.id.uuidString] ?? "nil")")
        return gradeNames[grade.id.uuidString]
    }

    func removeGradeName(for grade: gradeData) -> Bool { // 修改為使用 GradeData
        if gradeNames.removeValue(forKey: grade.id.uuidString) != nil {
            return true
        }
        return false
    }
    
    func addChoiceDept(deptID: String) -> String {
        if choiceDept.contains(deptID) {
            choiceDept.remove(at: Int(choiceDept.firstIndex(of: deptID)!))
            return "已成功將此校系移出志願"
        } else if choiceDept.count == 6 {
            return "加入失敗！您的志願已經超過六個校系，請到「志願選填」把其他志願刪除，再加入本校系。如果只是加入參考，請使用「最愛校系」功能。"
        } else {
            choiceDept.append(deptID)
            return "已成功將此校系加入志願列表，請到「志願選填」查看所有志願"
        }
    }
    
}
