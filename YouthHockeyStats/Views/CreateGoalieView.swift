//
//  CreateGoalieView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/26/23.
//

import SwiftUI

struct CreateGoalieView: View {
    
    
    var body: some View {
        
        NavigationView{

                VStack{
                    Image("Logo")
                        .resizable()
                        .frame(width: 125.0, height: 125.0)
                        .padding(.top,5)
                    Text("\"It's a great day for hockey\"")
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                    
                    NavigationLink(destination: GameView()) {
                        Text("New Game")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 400)
                    }
                }.background(Image("background"))
        }
    }
    
    
    
    struct CreateGoalieView_Previews: PreviewProvider {
        static var previews: some View {
            CreateGoalieView()
        }
    }
}
