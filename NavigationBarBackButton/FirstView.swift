//
//  FirstView.swift
//  NavigationBarBackButton
//
//  Created by kaito-seita on 2023/10/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("FirstView")
                Spacer()
                    .frame(height: 50)
                NavigationLink(destination: {
                    SecondView()
                }, label: {
                    Text("SecondView")
                })
            }
        }
    }
}

#Preview {
    FirstView()
}
