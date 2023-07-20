//
//  CustomToggle.swift
//  CustomComponent
//
//  Created by apple on 2023/07/20.
//

import SwiftUI

struct CustomToggle: View {
    @State var size: Bool = false
    @State var toggle: Bool = false
    @Namespace var circle: Namespace.ID
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Color.blue'
                Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    .offset(x: 100, y: 100)
                Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    .offset(x: 180, y: 100)
                Circle()
                    .fill(.gray)
                    .frame(width: size ? 30 : 80, height: size ? 30 : 80)
                    .offset(x: size ? 175 : toggle ? 190 : 110 , y: size ? 135 : toggle ? 110 : 110)
                    .matchedGeometryEffect(id: "Circle", in: circle)
            }
            Button(action: {
                withAnimation(.easeOut) {
                    toggle.toggle()
                    size.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.15) {
                        withAnimation(.easeIn) {
                            size.toggle()
                        }
                    }
                }
            }) {
                Text("test")
            }
        }
    }
}


struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle()
    }
}
