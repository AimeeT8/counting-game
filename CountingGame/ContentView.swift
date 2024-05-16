//
//  ContentView.swift
//  CountingGame
//
//  Created by Temple on 2024-04-29.
//

import SwiftUI


struct ContentView: View {
      
    @State private var multTable = 2
    
    @State private var numOfQuestions = 0
    @State private var numOfQuestion = 5
    @State private var exactQuestions = [5, 10, 15, 20, 25]
    
    
    @State private var playingGame = false
    @State private var configuringGame = true
    
     
    @State private var showingSheet = false
    
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                
                
                LinearGradient(colors: [.teal, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                
                
                
                
                
                VStack {
                    Text("Math is fun!!")
                        .font(.title).bold()
                        .padding()
                    
                    
                    Form {
                        
                       
                        Section("Let's multiply!") {
                            
                            
                            Picker("Pick a multiplication table", selection: $multTable)
                            {
                                ForEach(2..<13, id: \.self) {
                                    Text("\($0)")
                                }
                                
                            }
                            
                            Picker("How many games?", selection: $numOfQuestion) {
                                ForEach(0..<exactQuestions.count, id: \.self) {
                                    Text("\(exactQuestions[$0])")
                                }
                            }
                        }
                        
                        
                    }
                    
                    
                    
                    
                    .frame(width: 400, height: 200)
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        showingSheet.toggle()
                    }label: {
                        Text("PLAY!").bold()
                    }
                    .frame(width: 250, height: 50)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .sheet(isPresented: $showingSheet, content: {
                        SecondView(name: "User")
                       
                    })
                }
            }
            
            
        }
    }
}
            
          
    
    


          

#Preview {
    ContentView()
}
