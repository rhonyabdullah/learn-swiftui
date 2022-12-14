//
//  ContentView.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import SwiftUI

struct ContentView: View {

    let hikes = Hike.all()
    var body: some View {
        NavigationView {
            List(hikes, id: \.name) { hike in
                NavigationLink(destination: HikingDetails(hike: hike)) {
                    HikeCell(hike: hike)
                }
            }.navigationBarTitle("Hikings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HikeCell: View {

    var hike: Hike

    var body: some View {
        HStack {
            Image(hike.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            VStack(alignment: .leading) {
                Text(hike.name)
                Text(String(format: "%.2f miles", hike.miles))
            }
        }
    }
}
