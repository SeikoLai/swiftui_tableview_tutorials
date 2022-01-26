//
//  TableView.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import SwiftUI

struct MainList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List(modelData.response.results) { user in
                NavigationLink {
                    MainTableDetail(user: user)
                } label: {
                    MainTableRow(user: user)
                }
            }
            .navigationTitle("People")
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        MainList()
            .environmentObject(ModelData())
    }
}
