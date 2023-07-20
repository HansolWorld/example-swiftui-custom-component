//
//  TagView.swift
//  CustomComponent
//
//  Created by apple on 2023/07/18.
//

import SwiftUI

struct TagView: View {
    let keywords: [String] = ["여기", "단어가", "길이에",  "따라", "자동으로", "줄바꿈이", "되는", "TagView", "입니다"]
    let fontSize: CGFloat = 17
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                ForEach(getRows(), id: \.self) { rows in
                    HStack {
                        ForEach(rows, id: \.self) { keyword in
                            tagView(tag: keyword)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
        }
    }
    
    @ViewBuilder
    func tagView(tag: String) -> some View {
        Text(tag)
            .font(.system(size: fontSize))
            .padding(10)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
 
    func getRows() -> [[String]] {
        var rows: [[String]] = []
        var currentRow: [String] = []
        
        var totalWidth: CGFloat = 0
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        keywords.forEach { keyword in
            totalWidth += (fontSize(text: keyword) + 30)
            
            if totalWidth > screenWidth {
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? fontSize(text: keyword) + 30 : 0)
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(keyword)
            } else {
                currentRow.append(keyword)
            }
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
    
    func fontSize(text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        
        return size.width
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
