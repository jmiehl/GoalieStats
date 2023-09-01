//
//  YouthHockeyStatsApp.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/25/23.
//

import SwiftUI

@main
struct YouthHockeyStatsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            StatsTabView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
