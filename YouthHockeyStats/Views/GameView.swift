//
//  GameView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/25/23.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State var Shots: Double = 0
    @State var Goals: Double = 0
    @State var SavePct: Float = 100.00
    @State var name: String = ""
    @State var seasonShots: Double = 0
    @State var seasonGoals: Double = 0
    @State var seasonSavePct: Float = 0.00
   
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    // Shots Text
                   
                    Text("Shots")
                        .font(.largeTitle)
                    Spacer()
                    
                    Text(String(format:"%.0f",Shots))
                        .font(.largeTitle)
                }.foregroundColor(.white)
                
                HStack{
                    // Goals Text
                    Text("Goals")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text(String(format:"%.0f",Goals))
                        .font(.largeTitle)

                }.foregroundColor(.white)
                
                HStack{
                    // Save Pct Text
                    Text("Save %")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text(String(format: "%.1f",SavePct))
                        .font(.largeTitle)
                }.foregroundColor(.white)
                
                Spacer()
                
                // Shot buttons
                HStack{
                    Spacer()
                    Button("Shots -"){
                        if (Shots == 1 || Shots == 0) && Goals == 0{
                            Reset()
                        } else if Shots != 0 && (Shots > Goals || Shots != Goals) {
                            Shots -= 1
                                savePercentage()
                        }
                    }.buttonStyle(BorderedProminentButtonStyle()).foregroundColor(.white)
                        .font(.largeTitle)
                    Spacer()
                    
                    Button("Shots +"){
                        Shots += 1
                        savePercentage()
                    }.buttonStyle(BorderedProminentButtonStyle()).foregroundColor(.white)
                        .font(.largeTitle)
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button("Goals -"){
                        if Goals != 0 {
                            Goals -= 1
                            savePercentage()
                        }
                    }.buttonStyle(BorderedProminentButtonStyle()).foregroundColor(.white)
                        .font(.largeTitle)
                    Spacer()
                    
                    Button("Goals +"){
                        if Goals != Shots {
                            Goals += 1
                            savePercentage()
                        }
                    }.buttonStyle(BorderedProminentButtonStyle()).foregroundColor(.white)
                        .font(.largeTitle)
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button("Reset") {
                        Reset()                }.buttonStyle(BorderedProminentButtonStyle())
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                    Button("Submit") {
                        DataController().addGame(name: name, shots: Shots, goals: Goals, savePct: SavePct, seasonGoals: seasonGoals, seasonShots: seasonShots, seasonSavePct: seasonSavePct,context: managedObjContext)
                        dismiss()
                        
                    }.buttonStyle(BorderedProminentButtonStyle())
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Spacer()
                }
                
            }
           
        }
    }
    
    func savePercentage(){
        SavePct = Float((Shots - Goals) / Shots) * 100
        print(SavePct)
    }
    
    func Reset() {
        Goals = 0
        Shots = 0
        SavePct = 100.00
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
