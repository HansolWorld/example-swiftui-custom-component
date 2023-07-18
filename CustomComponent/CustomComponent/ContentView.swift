//
//  ContentView.swift
//  CustomComponent
//
//  Created by apple on 2023/07/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: TagView()) {
                    Text("TagView")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
