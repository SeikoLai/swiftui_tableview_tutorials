//
//  SwiftUITableDemoApp.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import SwiftUI

@main
struct SwiftUITableDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
