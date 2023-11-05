//
//  SecondView.swift
//  NavigationBarBackButton
//
//  Created by kaito-seita on 2023/10/24.
//

import SwiftUI

struct SecondView: View {
    
    var body: some View {
        VStack {
            Text("SecondView")
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .navigationBackButton()
        .edgeSwipe()
    }
}

#Preview {
    SecondView()
}
