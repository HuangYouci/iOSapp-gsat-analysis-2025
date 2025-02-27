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
    
    init(){
        self.favoriteDept = UserDefaults.standard.array(forKey: "favoriteDept") as? [String] ?? []
        self.choiceDept = UserDefaults.standard.array(forKey: "choiceDept") as? [String] ?? []
    }
    
}
