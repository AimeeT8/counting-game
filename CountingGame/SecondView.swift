//
//  SecondView.swift
//  CountingGame
//
//  Created by Temple on 2024-05-15.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name:String
    @State private var count = 0
    
    @State private var questionArray = [String]()
    @State private var answerArray = [Int]()
    @State private var userAnswer: Int = 0
    @State private var answer = 0
    @State private var currentQuestion = 0
    @State private var displayQuestion = " "
    
    // score related variables
    @State private var score = 0
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var gameOver = false
    
   
   
    
    
    var body: some View {
        VStack {
            Form {
                //text field to enter their name
                Text("Hello \(name)")
                
                // text field with multiplication question
                Text(displayQuestion)
                
                TextField("User answer", value: $userAnswer, format: .number)
                
                
                //button to check answer
                Button {
                    // some code
                } label: {
                    Text("Submit")
                }
               
                
                
            }
            
            
            
        }
        
          
        Button("Dismiss") {
            dismiss()
               
        }
        .frame(width: 250, height: 50)
        .background(.blue)
        .foregroundStyle(.white).bold()
        .clipShape(.rect(cornerRadius: 20))
        
        
    }
    
    
    
}






#Preview {
    SecondView(name: "Chlo")
}
