//
//  ShareImgView.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/23.
//

import SwiftUI

struct ShareImgView: View {
    
    // --------------- //
    // EnvironmentObject
    // StateObject
    // Binding
    // State
    // --------------- //
    
    var department: deptListModel
    
    // 預設背景圖片的名稱陣列
    let backgrounds = ["sharebg1", "sharebg2", "sharebg3", "sharebg4", "sharebg5", "sharebg6", "sharebg7", "sharebg8", "sharebg9"]

    // 隨機選擇背景圖片
    var randomBackground: String {
        let randomIndex = Int.random(in: 0..<backgrounds.count)
        return backgrounds[randomIndex]
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                VStack(alignment: .leading) {
                    Text(department.schoolName)
                        .font(.title)
                        .bold()
                    Text(department.departmentName)
                        .font(.largeTitle)
                        .bold()
                }
                Spacer()
                HStack{
                    if department.passChance >= 0.8 {
                        VStack{
                            Text("保底志願")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                            Text("\(Image(systemName: "star.fill")) \(Image(systemName: "star.fill")) \(Image(systemName: "star.fill")) \(Image(systemName: "star.fill")) \(Image(systemName: "star.fill"))")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.95, green: 0.35, blue: 0.27),
                                    Color(red: 0.96, green: 0.46, blue: 0.18)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    } else if department.passChance >= 0.6 {
                        VStack{
                            Text("安全志願")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                            Text("\(Image(systemName: "star.fill")) \(Image(systemName: "star.fill")) \(Image(systemName: "star.fill")) \(Image(systemName: "star.fill"))")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.51, green: 0.22, blue: 0.89),
                                    Color(red: 0.38, green: 0.36, blue: 0.73)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    } else if department.passChance >= 0.4 {
                        VStack{
                            Text("一般志願")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                            Text("\(Image(systemName: "star.fill")) \(Image(systemName: "star.fill")) \(Image(systemName: "star.fill"))")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.04, green: 0.54, blue: 0.64),
                                    Color(red: 0.35, green: 0.70, blue: 0.97)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    } else if department.passChance >= 0.2 {
                        VStack{
                            Text("進攻志願")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                            Text("\(Image(systemName: "star.fill")) \(Image(systemName: "star.fill"))")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.09, green: 0.36, blue: 0.29),
                                    Color(red: 0.14, green: 0.48, blue: 0.30)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    } else if department.passChance > 0 {
                        VStack{
                            Text("夢幻志願")
                                .font(.title2)
                                .foregroundColor(.black)
                                .bold()
                            Text("\(Image(systemName: "star.fill"))")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.62, green: 0.50, blue: 0.80),
                                    Color(red: 0.97, green: 0.76, blue: 0.90)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
            }
            .padding(.top, 45)
            .padding(.bottom, 45)
            
            HStack{
                VStack{
                    Text("甄試人數")
                        .font(.title2)
                    Text(department.expectedExamCount)
                        .font(.largeTitle)
                        .bold()
                }
                Rectangle()
                    .frame(width: 2, height: 70)
                    .padding(.horizontal, 10)
                VStack{
                    Text("錄取人數")
                        .font(.title2)
                    Text(department.enrollmentQuota)
                        .font(.largeTitle)
                        .bold()
                }
                Rectangle()
                    .frame(width: 2, height: 70)
                    .padding(.horizontal, 10)
                VStack{
                    HStack{
                        Text("願景")
                        Spacer()
                        Text(department.visionProgramAdditionalQuota)
                    }
                    HStack{
                        Text("離島")
                        Spacer()
                        Text(department.outlyingIslandAdditionalQuota)
                    }
                     HStack{
                         Text("原住民")
                         Spacer()
                         Text(department.indigenousAdditionalQuota)
                     }
                }
                .font(.title2)
                
            }
            .padding()
            .background(Color(.black).opacity(0.1))
            .cornerRadius(10)
            
            VStack{
                Grid{
                    GridRow{
                        if (department.chineseTest != "--") { Text("國文")
                        }
                        if (department.englishTest != "--") { Text("英文")
                        }
                        if (department.mathATest != "--") { Text("數Ａ")
                        }
                        if (department.mathBTest != "--") { Text("數Ｂ")
                        }
                        if (department.scienceTest != "--") { Text("自然")
                        }
                        if (department.socialTest != "--") { Text("社會")
                        }
                        if (department.englishListeningTest != "--") { Text("英聽")
                        }
                        if (!department.programmingConceptTest.isEmpty) { Text("程設觀念")
                        }
                        if (!department.programmingPracticalTest.isEmpty) { Text("程設實作")
                        }
                        if (!department.practicalExamItem1Test.isEmpty) {
                            switch department.departmentType {
                            case "美術":
                                Text("素描")
                            case "體育":
                                Text("體育")
                            case "音樂":
                                Text("主修")
                            default:
                                Text("術科項目1")
                            }
                        }
                        if (!department.practicalExamItem2Test.isEmpty) {
                            switch department.departmentType {
                            case "美術":
                                Text("彩繪技法")
                            case "音樂":
                                Text("副修")
                            default:
                                Text("術科項目2")
                            }
                        }
                        if (!department.practicalExamItem3Test.isEmpty) {
                            switch department.departmentType {
                            case "美術":
                                Text("創意表現")
                            case "音樂":
                                Text("樂理")
                            default:
                                Text("術科項目3")
                            }
                        }
                        if (!department.practicalExamItem4Test.isEmpty) {
                            switch department.departmentType {
                            case "美術":
                                Text("水墨書畫")
                            case "音樂":
                                Text("視唱")
                            default:
                                Text("術科項目4")
                            }
                        }
                        if (!department.practicalExamItem5Test.isEmpty) {
                            switch department.departmentType {
                            case "美術":
                                Text("美術鑒賞")
                            case "音樂":
                                Text("聽寫")
                            default:
                                Text("術科項目5")
                            }
                        }
                        Spacer()
                    }
                    GridRow{
                        if (department.chineseTest != "--") { Text(department.chineseTest)
                        }
                        if (department.englishTest != "--") { Text(department.englishTest)
                        }
                        if (department.mathATest != "--") { Text(department.mathATest)
                        }
                        if (department.mathBTest != "--") { Text(department.mathBTest)
                        }
                        if (department.scienceTest != "--") { Text(department.scienceTest)
                        }
                        if (department.socialTest != "--") {
                            Text(department.socialTest)
                        }
                        if (department.englishListeningTest != "--") { Text(department.englishListeningTest)
                        }
                        if ( !department.programmingConceptTest.isEmpty) { Text(department.programmingConceptTest)
                        }
                        if ( !department.programmingPracticalTest.isEmpty ) { Text(department.programmingPracticalTest)
                        }
                        if ( !department.practicalExamItem1Test.isEmpty ) { Text(department.practicalExamItem1Test)
                        }
                        if ( !department.practicalExamItem2Test.isEmpty ) { Text(department.practicalExamItem2Test)
                        }
                        if ( !department.practicalExamItem3Test.isEmpty ) { Text(department.practicalExamItem3Test)
                        }
                        if ( !department.practicalExamItem4Test.isEmpty ) { Text(department.practicalExamItem4Test)
                        }
                        if ( !department.practicalExamItem5Test.isEmpty ) { Text(department.practicalExamItem5Test)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color(.black).opacity(0.1))
            .cornerRadius(10)
            .padding(.bottom, 300)
            
            Text("下載 App 並搜尋代碼 \(department.id) \n來獲得關於校系詳細資料以及個人落點分析！")
            HStack{
                Image("clearlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.trailing, -10)
                VStack(alignment: .leading){
                    Text("學測個申分析系統")
                        .font(.title2)
                    Text("YC Apps")
                    Text("可至 App Store 取得")
                        .opacity(0.8)
                }
            }
            .padding(.bottom, 45)
            Text("")
            
        }
        .foregroundStyle(Color(.white))
        .shadow(radius: 1)
        .padding()
        .background(Color(.black).opacity(0.1))
        .background(.thinMaterial.opacity(0.6))
        .background(
            Image(randomBackground)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .frame(width: 540, height: 960)
        
    }
    
}
