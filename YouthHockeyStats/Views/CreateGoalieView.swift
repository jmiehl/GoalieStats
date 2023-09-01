//
//  CreateGoalieView.swift
//  YouthHockeyStats
//
//  Created by Joe Miehl on 8/26/23.
//

import SwiftUI
import CoreData

struct CreateGoalieView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var game:FetchedResults<Goalie>
    
    @State private var showingAddView = false
    
    var body: some View {
        

                VStack{
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .frame(width: 125.0, height: 125.0)
                        .padding(.top,5)
                    Text("\"It's a great day for hockey\"")
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                }.background(Image("background"))
        }
    
    
    
    
    struct CreateGoalieView_Previews: PreviewProvider {
        static var previews: some View {
            CreateGoalieView()
        }
    }
}
