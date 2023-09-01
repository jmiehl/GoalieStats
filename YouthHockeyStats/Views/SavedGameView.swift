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
                            Text("Date: \(game.date!, style: .date)")
                            Text("Shots: \(game.shots)")
                                .bold()
                            Text("Goals: \(game.goals)")
                                .bold()
                            Text(("Save Pct: \(game.savePct)"))
                            
                            
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
