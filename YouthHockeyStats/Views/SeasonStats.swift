//
//  SeasonStats.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 9/1/23.
//

import SwiftUI

struct SeasonStats: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var game:FetchedResults<Goalie>
   
    
    
    var body: some View {
        
        List {
           
        
            ForEach(game) { game in
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            
                            if game.name == "Ethan" {
                                Text(game.name!)}
                            Text("Season Shots: " + String(game.seasonShots))
                           
                            
                            
                        }
                        Spacer()
                    }
                }
        }
           
        }
    }

 

struct SeasonStats_Previews: PreviewProvider {
    static var previews: some View {
        SeasonStats()
    }
}
