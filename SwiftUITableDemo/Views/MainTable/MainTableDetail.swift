//
//  MainTableDetail.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import SwiftUI

struct MainTableDetail: View {
    @EnvironmentObject var modelData: ModelData
    var user: User
    
    var body: some View {
        Text("Hello \(user.name.first)")
    }
}

struct MainTableDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MainTableDetail(user: modelData.response.results[0])
            .environmentObject(modelData)
    }
}
