//
//  HomeView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/7.
//

import SwiftUI

struct HomeView: View {
    
    // --------------- //
    // EnvironmentObject
    // StateObject
    @EnvironmentObject private var data: UserData
    @EnvironmentObject private var databaseInfo: DatabaseInfo
    // Binding
    @Binding var selectedTab: Int
    // State
    @FocusState private var focusField: Field?
    @State private var EditingGradeCH = ""
    @State private var EditingGradeMA = ""
    @State private var EditingGradeMB = ""
    @State private var EditingGradeSC = ""
    @State private var EditingGradeSO = ""
    @State private var EditingGradeEN = ""
    @State private var EditingGradeEL = 4
    @State private var EditingGradePC = 0
    @State private var EditingGradePP = 0
    @State private var EditingGradeSK1 = "0"
    @State private var EditingGradeSK2 = "0"
    @State private var EditingGradeSK3 = "0"
    @State private var EditingGradeSK4 = "0"
    @State private var EditingGradeSK5 = "0"
    @State private var EditingGradeSKT = 0
    @State private var isFinishedForm = false
    @State private var showOtherSubjectView = false
    @State private var contentHeight: CGFloat = 0
    // --------------- //
    
    enum Field: Hashable {
        case gradeCH, gradeEN, gradeMA, gradeMB, gradeSC, gradeSO
    }
    
    func isValidGrade(_ grade: String) -> Bool {
        if let gradeValue = Int(grade), gradeValue >= 0, gradeValue <= 15 {
            return true
        }
        return false
    }
    
    func isValidGradeSK(_ grade: String) -> Bool {
        if let gradeValue = Int(grade), gradeValue >= 0, gradeValue <= 100 {
            return true
        }
        return false
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            HStack{
                Text("學測個申分析")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            VStack{
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        VStack{
                            Text({
                                let now = Date()
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "MMM"
                                dateFormatter.timeZone = TimeZone.current // 可選
                                return dateFormatter.string(from: now)
                            }())
                            .font(.caption)
                            Text({
                                let now = Date()
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "dd"
                                dateFormatter.timeZone = TimeZone.current // 可選
                                return dateFormatter.string(from: now)
                            }())
                            .font(.title3)
                            .bold()
                        }
                        .padding(1)
                        .foregroundStyle(Color(.red))
                        Circle()
                            .fill(Color(.label).opacity(0.5))
                            .frame(width: 5, height: 5)
                            .padding(.horizontal, 3)
                        VStack{
                            Text("學測倒數")
                                .font(.caption)
                            Text({
                                let components = Calendar.current.dateComponents([.day], from: Date(), to: Date(timeIntervalSince1970: 1769385600))
                                
                                if let days = components.day {
                                    if days > 0 {
                                        return "\(days)"
                                    } else {
                                        return "--"
                                    }
                                } else {
                                    return "??"
                                }
                            }())
                            .font(.title3)
                            .bold()
                        }
                        VStack{
                            Text("成績公布")
                                .font(.caption)
                            Text({
                                let components = Calendar.current.dateComponents([.day], from: Date(), to: Date(timeIntervalSince1970: 1771977600))
                                
                                if let days = components.day {
                                    if days > 0 {
                                        return "\(days)"
                                    } else {
                                        return "--"
                                    }
                                } else {
                                    return "??"
                                }
                            }())
                            .font(.title3)
                            .bold()
                        }
                        Circle()
                            .fill(Color(.label).opacity(0.5))
                            .frame(width: 5, height: 5)
                            .padding(.horizontal, 3)
                        VStack{
                            Text("分析次數")
                                .font(.caption)
                            Text("\(data.analyzeCount)")
                                .font(.title3)
                                .bold()
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                .background(Color(.systemBackground))
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 20,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0
                    )
                )
            }
            .background(Color(.secondarySystemBackground))
            
            ScrollView {
                
                Color.clear
                    .padding(.bottom, 5)
                
                HStack{
                    Image(systemName: "square.and.pencil")
                    Text("成績輸入")
                    Spacer()
                }
                .padding(.bottom,10)
                .padding(.horizontal)
                .foregroundStyle(Color(.systemGray))
                
                Text("請輸入 0 到 15 的整數（您的成績級分），如果您未報考該科，請輸入 0 級分；於英聽，請選擇 A/B/C/F 級。")
                    .font(.caption)
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .foregroundStyle(Color(.systemGray))
                
                VStack{
                    
                    HStack{
                        gradeInputView(label: "國文", grade: $EditingGradeCH, field: .gradeCH)
                        gradeInputView(label: "英文", grade: $EditingGradeEN, field: .gradeEN)
                    }
                    HStack{
                        gradeInputView(label: "數Ａ", grade: $EditingGradeMA, field: .gradeMA)
                        gradeInputView(label: "數Ｂ", grade: $EditingGradeMB, field: .gradeMB)
                    }
                    HStack{
                        gradeInputView(label: "自然", grade: $EditingGradeSC, field: .gradeSC)
                        gradeInputView(label: "社會", grade: $EditingGradeSO, field: .gradeSO)
                    }
                    
                    HStack {
                        HStack {
                            
                            Text("英聽")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            Picker(selection: $EditingGradeEL){
                                Text("A 級").tag(1)
                                Text("B 級").tag(2)
                                Text("C 級").tag(3)
                                Text("F 級 / 未報考").tag(4)
                            } label : {
                                Text("英文聽力選擇")
                            }
                            .background(Color.clear)
                            
                            
                        }
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                        
                        Spacer()
                        
                        Button(role: .none){
                            showOtherSubjectView = true
                        } label: {
                            Text("其他科目")
                                .padding(5)
                        }
                        .buttonStyle(.borderedProminent)
                        
                    }
                    
                }
                .padding(.horizontal)
                
                Text(databaseInfo.announcement)
                .font(.caption)
                .padding(.top, 10)
                .padding(.horizontal)
                .foregroundStyle(Color(.systemGray))
                
            }
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            .background(Color(.secondarySystemBackground))
                
            VStack{
                if isFinishedForm {
                    
                    HStack{
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                        Text("成績輸入完成")
                            .foregroundColor(.green)
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    HStack{
                        Text("成績已新增，到「分析」結果頁選擇該筆分析結果以查看詳細分析！")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray))
                        Spacer()
                    }
                    
                    Button(role: .none) {
                        selectedTab = 1
                    } label : {
                        Spacer()
                        
                        Text("查看分析結果")
                        
                        Spacer()
                    }
                    .clipShape(Capsule())
                    .buttonStyle(.borderedProminent)
                    
                } else {
                    
                    if data.analyzeCount < 1 {
                        
                        HStack{
                            Image(systemName: "exclamationmark.triangle")
                                .foregroundColor(.red)
                            Text("分析次數不足")
                                .foregroundColor(.red)
                            
                            Spacer()
                        }
                        .padding(.bottom,5)
                        
                        Text("目前沒有分析次數了，可透過觀看廣告來獲得觀看次數，或是購買付費用戶等級來獲得無限分析次數。")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray))
                        
                        Button(role: .none) {
                            
                            hideKeyboard()
                            selectedTab = 2
                            
                        } label : {
                            Spacer()
                            
                            Text("前往「關於」頁面")
                            
                            Spacer()
                        }
                        .clipShape(Capsule())
                        .buttonStyle(.borderedProminent)
                        
                    } else {
                        
                        Button(role: .none) {
                            
                            hideKeyboard()
                            data.addNewResultData(gradeCH: Int(EditingGradeCH) ?? 0 , gradeEN: Int(EditingGradeEN) ?? 0 , gradeMA: Int(EditingGradeMA) ?? 0 , gradeMB: Int(EditingGradeMB) ?? 0 , gradeSC: Int(EditingGradeSC) ?? 0 , gradeSO: Int(EditingGradeSO) ?? 0 , gradeEL: EditingGradeEL, gradePC: EditingGradePC, gradePP: EditingGradePP, gradeSK1: Int(EditingGradeSK1) ?? 0 , gradeSK2: Int(EditingGradeSK2) ?? 0 , gradeSK3: Int(EditingGradeSK3) ?? 0 , gradeSK4: Int(EditingGradeSK4) ?? 0 , gradeSK5: Int(EditingGradeSK5) ?? 0 , gradeSKT: EditingGradeSKT)
                            isFinishedForm = true
                            data.analyzeCount -= 1
                            
                        } label : {
                            Spacer()
                            
                            Text("提交")
                            
                            Spacer()
                        }
                        .clipShape(Capsule())
                        .buttonStyle(.borderedProminent)
                        .disabled(
                            !isValidGrade(EditingGradeCH) ||
                            !isValidGrade(EditingGradeMA) ||
                            !isValidGrade(EditingGradeMB) ||
                            !isValidGrade(EditingGradeSC) ||
                            !isValidGrade(EditingGradeSO) ||
                            !isValidGrade(EditingGradeEN) ||
                            !isValidGradeSK(EditingGradeSK1) ||
                            !isValidGradeSK(EditingGradeSK2) ||
                            !isValidGradeSK(EditingGradeSK3) ||
                            !isValidGradeSK(EditingGradeSK4) ||
                            !isValidGradeSK(EditingGradeSK5) || data.analyzeCount < 1
                        )
                        
                    }
                    
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            
        }
        .sheet(isPresented: $showOtherSubjectView){
            OtherSubjectChooseView(EditingGradePC: $EditingGradePC, EditingGradePP: $EditingGradePP, EditingGradeSK1: $EditingGradeSK1, EditingGradeSK2: $EditingGradeSK2, EditingGradeSK3: $EditingGradeSK3, EditingGradeSK4: $EditingGradeSK4, EditingGradeSK5: $EditingGradeSK5, EditingGradeSKT: $EditingGradeSKT, showOtherSubjectView: $showOtherSubjectView)
        }
        .onAppear{
            isFinishedForm = false
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                
                Button {
                    
                    switch focusField {
                        case .gradeCH:
                            focusField = .gradeEN
                        case .gradeEN:
                            focusField = .gradeMA
                        case .gradeMA:
                            focusField = .gradeMB
                        case .gradeMB:
                            focusField = .gradeSC
                        case .gradeSC:
                            focusField = .gradeSO
                        case .gradeSO:
                            focusField = nil
                    case .none:
                        focusField = nil
                    }
                    
                } label: {
                    Text("下一格")
                        .foregroundColor(.accentColor)
                    Image(systemName: "arrow.forward")
                }
                
                Button {
                    focusField = nil
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
                
            }
        }
    }
    
    private func gradeInputView(label: String, grade: Binding<String>, field: Field) -> some View {
            HStack {
                Text(label)
                    .foregroundColor(.accentColor)
                TextField("0 至 15", text: grade)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($focusField, equals: field)
                    .onSubmit {
                        switch field {
                        case .gradeCH:
                            focusField = .gradeEN
                        case .gradeEN:
                            focusField = .gradeMA
                        case .gradeMA:
                            focusField = .gradeMB
                        case .gradeMB:
                            focusField = .gradeSC
                        case .gradeSC:
                            focusField = .gradeSO
                        case .gradeSO:
                            focusField = nil
                        }
                    }
                Text("級")
                    .foregroundColor(Color(.systemGray2))
            }
            .padding(10)
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(isValidGrade(grade.wrappedValue) ? Color.clear : Color.red, lineWidth: 1)
                    .opacity(isValidGrade(grade.wrappedValue) ? 0 : 1)
                    .animation(isValidGrade(grade.wrappedValue) ? nil : Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: grade.wrappedValue)
            )
        }
}

#Preview {
    HomeView(selectedTab: .constant(1))
        .environmentObject(DatabaseInfo())
        .environmentObject(UserData())
}
