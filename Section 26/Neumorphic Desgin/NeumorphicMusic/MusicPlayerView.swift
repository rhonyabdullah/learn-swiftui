//
//  MusicPlayerView.swift
//  NeumorphicMusic
//
//  Created by Rhony Abdullah Siagian on 05/01/23.
//

import SwiftUI

struct MusicPlayerView: View {

    private let colorBg = Color(#colorLiteral(red: 0.9122470021, green: 0.9597501159, blue: 0.9985468984, alpha: 1))
    @State private var sliderValue: Double = 0.5

    var body: some View {
        VStack {
            HStack {
                NeumorphicImageButton(
                    systemName: "arrow.left",
                    size: CGSize(width: 20, height: 20),
                    color: Color.black,
                    onTap: {

                    }
                )
                Spacer()
                Text("Now Playing")
                Spacer()
                NeumorphicImageButton(
                    systemName: "line.horizontal.3",
                    size: CGSize(width: 20, height: 20),
                    color: Color.black,
                    onTap: {

                    }
                )
            }.padding([.leading, .trailing], 16)

            ZStack {
                Image("art")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .padding()
                    .shadow(color: Color.gray, radius: 10, x: 9, y: 9)
                    .shadow(color: Color.white, radius: 10, x: -9, y: -9)

            }.clipShape(Circle().inset(by: 6))
                .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
                .shadow(color: Color.white, radius: 10, x: -5, y: -5)


            Spacer()

            Slider(value: $sliderValue, in: 0...1, step: 0.1)
                .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
                .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                .padding()

            HStack {
                NeumorphicImageButton(
                    systemName: "backward.fill",
                    size: CGSize(width: 20, height: 20),
                    color: Color.black,
                    onTap: {

                    }
                )

                Spacer()

                NeumorphicImageButton(
                    systemName: "stop.fill",
                    size: CGSize(width: 40, height: 40),
                    color: Color.black,
                    onTap: {

                    }
                )

                Spacer()

                NeumorphicImageButton(
                    systemName: "forward.fill",
                    size: CGSize(width: 20, height: 20),
                    color: Color.black,
                    onTap: {

                    }
                )
            }.padding([.leading, .trailing], 16)

        }.background(colorBg)
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
