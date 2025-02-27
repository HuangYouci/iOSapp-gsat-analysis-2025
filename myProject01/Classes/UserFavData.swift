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
    
}
