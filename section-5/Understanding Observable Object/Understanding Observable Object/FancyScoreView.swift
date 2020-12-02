//
//  FancyScoreView.swift
//  Understanding Observable Object
//
//  Created by Rhony on 02/12/20.
//

import SwiftUI

struct FancyScoreView: View {
    
    @Binding var score: Int

    var body: some View {
        VStack {
            Text("\(self.score)")
            Button("Increment Score") {
                self.score += 1
            }
            .padding()
            .background(Color.orange)
            
        }.background(Color.gray)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView(score: .constant(0))
    }
}
