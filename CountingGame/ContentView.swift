//
//  ContentView.swift
//  CountingGame
//
//  Created by Temple on 2024-04-29.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    var body: some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
        
    }
}



struct QuestionAndAnswer {
    var operand1: Int
    var operand2: Int
    
    var answer: Int {
        operand1 * operand2
    }
    
    var questionText: String {
        "\(operand1) * \(operand2)"
    }
}

struct ContentView: View {
    
    
    
    
    
    
    
    @State private var multTable = 2
    
    @State private var numOfQuestions = 0
    @State private var numOfQuestion = 5
    let exactQuestions = [5, 10, 15, 20, 25]
    
    @State private var questionArray = [String]()
    @State private var answerArray = [Int]()
    @State private var userAnswer: Int = 0
    @State private var answer = 0
    @State private var currentQuestion = 0
    @State private var displayQuestion = " "
    
    // score related variables
    @State private var score = 0
    
    @State private var playingGame = false
    @State private var configuringGame = true
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var gameOver = false
    
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
                        
                        //   if configuringGame {
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
