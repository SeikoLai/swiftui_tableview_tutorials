//
//  ContentView.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
