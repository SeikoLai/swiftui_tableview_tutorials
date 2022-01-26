//
//  MainTableRow.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import SwiftUI

struct MainTableRow: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name.first).font(.headline)
        }
        .padding(.horizontal)
    }
}

struct MainTableRow_Previews: PreviewProvider {
    static var users = ModelData().response.results
    
    static var previews: some View {
        MainTableRow(user: users[0])
    }
}
