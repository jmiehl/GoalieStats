//
//  StatsTabView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/31/23.
//

import SwiftUI

struct StatsTabView: View {
    var body: some View {
        TabView{
            
            OpeningView()
                .tabItem {
                    VStack{
                        Text("Home Page")
                    }
                }
            
            GameView()
                .tabItem{
                    VStack{
                        Text("New Game")
                    }
                }
            SavedGameView()
                .tabItem{
                    VStack{
                        Text("Saved Games")
                    }
                }

    
            
        }.onAppear(){
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct StatsTabView_Previews: PreviewProvider {
    static var previews: some View {
        StatsTabView()
    }
}
