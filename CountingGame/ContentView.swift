//
//  ContentView.swift
//  CountingGame
//
//  Created by Temple on 2024-04-29.
//

import SwiftUI




struct ContentView: View {
    
    struct Problem {
         var operand1: Int
         var operand2: Int
        
        
        
        var correctAnswer: Int { operand1 * operand2 }
        
        var problemString: String {
            String("\(operand1) X \(operand2)")
        }
        
    }
    
    
    
    
    @State private var multTable = 2
    
    @State private var numOfQuestion = 0
    @State private var numOfQuestions = [5, 10, 15, 20, 25]
    @State private var difficultyLevel = 0
    @State private var difficultyLevels = [1, 2, 3]
    @State private var questionArray = [String]()
    @State private var answerArray = [Int]()
    @State private var userAnswer: Int = 0
    @State private var answer = 0
    @State private var currentQuestion = 0
    @State private var displayQuestion = " "
    
    @State private var animationAmount = 0.0
    
    @State private var score = 0
    
    
    @State private var playingGame = false
    @State private var configuringGame = true
    
    
    @State private var showAlert = false
    @State private var alertMessage = " "
    @State private var gameOver = false
    
   
    
    
    
    var body: some View {
        
        NavigationStack {
            
          
                VStack {
                    
                    Form {
                        
                        if configuringGame {
                            Section {
                                Picker("Multiplcation Table", selection: $multTable) {
                                    ForEach(2..<13, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                            } header: {
                                Text("Select a multiplication table")
                            }
                            Section {
                                Picker("Selection number of questions", selection: $numOfQuestion) {
                                    ForEach(numOfQuestions, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                                .pickerStyle(.segmented)
                            } header: {
                                Text("Select how many questions you would like to answer")
                            }
                            Section {
                            Picker("Difficulty Level", selection: $difficultyLevel) {
                                ForEach(difficultyLevels, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                        } header: {
                            Text("Select the level of difficulty")
                        }
                            Button("Play Game!") {
                                configureGame()
                            }
                            .foregroundStyle(.green).bold()
                        }
                        //play the game!
                        if playingGame {
                            Section {
                                Text(displayQuestion)
                                Section{
                                    TextField("Your answer", value: $userAnswer, format: .number)
                                    Button("Submit") {
                                        checkAnswer()
                                    }
                                    .foregroundStyle(.blue)
                                }
                                Section {
                                    Text("Score: \(score)")
                                }
                                
                                
                                }
                            Button("End Game") {
                                startNewGame()
                            }
                            .foregroundStyle(.red)
                            
                            .onAppear(perform: setQuestion)
                            .alert(alertMessage, isPresented: $showAlert) {
                             
                                Button("Ok") {
                                    
                                    if gameOver {
                                        startNewGame()
                                    } else {
                                        
                                    }
                                }
                                
                            }
                            
                          
                          
                        }
                           
                    }
                    .navigationTitle("Math is fun!!")
                    .navigationBarTitleDisplayMode(.inline)
                    
                     
                }
                
            }
            }
           
            func configureGame() {

                playingGame = true
                configuringGame = false
                gameOver = false

                var count = 0
                while count < numOfQuestion {
                    let randomNum = Int.random(in: 0...12)
                    let problem = Problem(operand1: multTable, operand2: randomNum)

                    let questionTexts = problem.problemString
                    let questionAnswer = problem.correctAnswer

                    questionArray.append(questionTexts)
                    answerArray.append(questionAnswer)

                    count += 1
                }
               
            }

            // check if user's number of questions has met the limit if so end the game
            func setQuestion() {
                if currentQuestion != numOfQuestion {
                    let displaysQuestion = questionArray[currentQuestion]
                    displayQuestion = displaysQuestion

                    let setAnswer = answerArray[currentQuestion]
                    answer = setAnswer

                    userAnswer = 0
                } else {
                    showAlert = true
                    alertMessage = "Game Over! Your score is \(score). Start New Game? "
                    gameOver = true
                }
            }

            // check if the answer is correct dispaly alert telling user if it's correct or incorrect.
            func checkAnswer() {
                    if answer == userAnswer {
                        score += 1
                        alertMessage = "Correct!"
                    } else {
                        score = score
                        alertMessage = "Sorry the answer is \(answer)"
                    }
                    currentQuestion += 1
                    showAlert = true
                    setQuestion()
                }

            //reset game
            func startNewGame() {
                currentQuestion = 0
                numOfQuestion = 0
                score = 0
                playingGame = false
                configuringGame = true
            }
        }

    
#Preview {
    ContentView()
}
