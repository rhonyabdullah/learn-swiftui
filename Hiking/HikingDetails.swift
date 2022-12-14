//
//  HikingDetails.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 14/12/22.
//

import SwiftUI

struct HikingDetails: View {

    var hike: Hike
    @State var zoomed: Bool = false

    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                withAnimation {
                    zoomed.toggle()
                }
            }
            Text(hike.name)
            Text(String(format: "%.2f miles", hike.miles))
        }.navigationBarTitle(Text(hike.name), displayMode: .inline)
    }
}

struct HikingDetails_Previews: PreviewProvider {
    static var previews: some View {
        HikingDetails(hike: Hike.single())
    }
}
