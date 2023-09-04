//
//  OpeningView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/31/23.
//

import SwiftUI

struct OpeningView: View {
    @State var name: String = ""
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
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
                
                    
                
            }
        }
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
