//
//  ContentView.swift
//  CountingGame
//
//  Created by Temple on 2024-04-29.
//

import SwiftUI

struct ContentView: View {
    
     
    @State private var randomQuestion = Int.random(in: 0..<5)
    
    
    @State private var numOfQuestion = 5
    @State private var answer = 2
    @State private var score = 0
    
    @State private var showingResults = false
    
    @State private var shouldWin = Bool.random()
    @State private var questionCount = 1
    
    
   
    @State private var numOfQuestions = 0
  
    let exactQuestions = [5, 10, 15, 20, 25]
    
    let questions = ["What is 2 x 2?", "What is 2 x 1?", "What is 5 x 5?", "What is 10 x 100?", "What is 10000 x 1?"]
    
    
    
    var body: some View {
        
        
        
        
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
                        
                        
                        Picker("Pick a multiplication table", selection: $answer)
                        {
                            ForEach(2..<13) {
                                Text("\($0) x \($0)" )
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
                    // bring to a different view
                }label: {
                    Text("PLAY!").bold()
                }
                .frame(width: 250, height: 50)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 20))
            }
        }
        
    
                    
                }
            }
            
          

#Preview {
    ContentView()
}
