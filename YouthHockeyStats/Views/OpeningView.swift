//
//  OpeningView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/31/23.
//

import SwiftUI

struct OpeningView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .padding(.top,5)
            Text("\"It's a great day for hockey\"")
                .foregroundColor(.white)
                .font(.title)
            Spacer()
        }.background(Image("background"))
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
