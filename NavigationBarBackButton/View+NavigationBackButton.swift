//
//  View+NavigationBackButton.swift
//  NavigationBarBackButton
//
//  Created by kaito-seita on 2023/11/02.
//

import SwiftUI

struct NavigationBackButton: ViewModifier {
    @Environment(\.dismiss) var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.uturn.backward")
                        }
                    ).tint(.black)
                }
            }
    }
}

extension View {
    
    func navigationBackButton() -> some View {
        self.modifier(NavigationBackButton())
    }
}
