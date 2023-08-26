//
//  GameView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/25/23.
//

import SwiftUI

struct GameView: View {
    
    @State var Shots: Float = 0
    @State var Goals: Float = 0
    @State var SavePct: Float = 100.00
    
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
                
                Button("Reset") {
                    Reset()                }.buttonStyle(BorderedProminentButtonStyle())
                    .foregroundColor(.white)
                    .font(.headline)
                
            }
           
        }
    }
    
    func savePercentage(){
        SavePct = Float((Shots - Goals) / Shots) * 100
        print(SavePct)
    }
    
    func Reset() {
        Goals = 0.00
        Shots = 0.00
        SavePct = 100.00
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
