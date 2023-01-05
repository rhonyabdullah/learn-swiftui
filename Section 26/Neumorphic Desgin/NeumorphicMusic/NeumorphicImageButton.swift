//
//  NeumorphicImageButton.swift
//  NeumorphicMusic
//
//  Created by Rhony Abdullah Siagian on 05/01/23.
//

import SwiftUI

struct NeumorphicImageButton: View {

    @State private var isPressed: Bool = false

    private let systemName: String
    private let onTap: () -> Void
    private let size: CGSize
    private let bgColor: Color = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    private let color: Color

    init(
        systemName: String,
        size: CGSize = CGSize(width: 60, height: 60),
        color: Color = Color.blue,
        onTap: @escaping () -> Void
    ) {
        self.systemName = systemName
        self.size = size
        self.color = color
        self.onTap = onTap
    }

    var body: some View {

        Button(action: {

            self.isPressed = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.isPressed = false
                self.onTap()
            }

        }) {

            Image(systemName: systemName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .padding()
                .foregroundColor(color)
                .background(bgColor)

        }.clipShape(Circle())
            .shadow(color: isPressed ? bgColor : Color.gray, radius: isPressed ? 3 : 5, x: 5, y: 5)
            .shadow(color: isPressed ? Color.gray : Color.white, radius: isPressed ? 4 : 8, x: -1, y: -1)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.spring(), value: 100)

    }
}

struct NeumorphicImageButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageButton(systemName: "heart.fill") { }
    }
}
