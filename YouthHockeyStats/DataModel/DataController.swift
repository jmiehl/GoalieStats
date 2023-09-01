//
//  DataController.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/31/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Goalie")
    
    //initialize data controller & persistent store
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    // function to save data w/ error handling
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Could not save the data")
        }
    }
    
    //func add game data with goalie name
    func addGame(name: String, shots: Double, goals: Double, savePct:Float, seasonGoals: Double, seasonShots: Double, seasonSavePct: Float, context: NSManagedObjectContext){
        let game = Goalie(context: context)
        game.id = UUID()
        game.date = Date()
        game.name = name
        game.shots = shots
        game.goals = goals
        game.savePct = savePct
        game.seasonGoals = seasonGoals
        game.seasonShots = seasonShots
        game.seasonSavePct = seasonSavePct
        
        save(context: context)
    }
    
    func editGame(game: Goalie, name: String, shots: Double, goals: Double, savePct: Float, seasonGoals: Double, seasonShots: Double, seasonSavePct: Float, context: NSManagedObjectContext) {
        game.date = Date()
        game.name = name
        game.shots = shots
        game.goals = goals
        game.savePct = savePct
        game.seasonGoals = seasonGoals
        game.seasonShots = seasonShots
        game.seasonSavePct = seasonSavePct
        
        save(context: context)
    }
    
    
}
