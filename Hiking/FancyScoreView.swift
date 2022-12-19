//
//  FancyScoreView.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 19/12/22.
//

import SwiftUI

struct FancyScoreView: View {

    @EnvironmentObject var settings: UserSettings

    var body: some View {
        VStack {
            Text("\(settings.score)")
            Button("Increment Score") {
                settings.score += 1
            }.padding().background(Color.green)
        }.padding().background(Color.orange)
    }
}

#if DEBUG
    struct FancyScoreView_Previews: PreviewProvider {
        static var previews: some View {
            FancyScoreView().environmentObject(UserSettings())
        }
    }
#endif
