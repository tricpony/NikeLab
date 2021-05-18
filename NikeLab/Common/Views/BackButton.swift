//
//  BackButton.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import SwiftUI

// Navigation back button with chevron only.
struct BackButton: View {
    var color: Color
    @Environment(\.presentationMode) var presentation

    var body: some View {
        Button(action: { presentation.wrappedValue.dismiss() }) {
          Image(systemName: "chevron.left")
            .foregroundColor(color)
            .imageScale(.large) }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(color: .black)
    }
}
