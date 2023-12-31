//
//  SavedGameView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/31/23.
//

import SwiftUI
import CoreData

struct SavedGameView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var game:FetchedResults<Goalie>
    

    var body: some View {
        
            List {
                
                ForEach(game) { game in
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(game.name!)
                            Text(game.date!, style: .date)
                                .foregroundColor(.blue)
                            Text("Shots: " + String(String(format:"%.0f", game.shots)))
                                .bold()
                            Text("Goals: " + String(String(format:"%.0f", game.goals)))
                                .bold()
                            Text("Save Pct: " + String(String(format:"%.1f", game.savePct)))
                                .bold()
                            Text("Season Shots: " + String(String(format:"%.0f", game.seasonShots)))
                            
                            Text("Season Goals: " + String(String(format:"%.0f", game.seasonGoals)))
                            
                            Text("Season Save %: " + String(String(format:"%.1f", game.seasonSavePct)))
                            
                        }
                        Spacer()
                        
                    }
                }
            
        }
        }
    }


struct SavedGameView_Previews: PreviewProvider {
    static var previews: some View {
        SavedGameView()
    }
}
