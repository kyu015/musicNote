//
//  QuestionView.swift
//  musicNote
//
//  Created by shiki on 2022/09/19.
//

import SwiftUI

struct QuestionView: View {
    var text: String
    var questionList = QuestionList().questionSetTreble
    var title: String
    let answers = ["ド", "レ", "ミ", "ファ", "ソ", "ラ", "シ"]
    
    @State var correct = true
    
    @State var question = ""
    @State var answer = ""
    
    init(text: String){
        self.text = text
        switch text{
        case "treble_1":
            self.title = "ド〜シ"
            self.questionList = QuestionList().questionSetTreble
        case "treble_1_reverse":
            self.title = "ド〜シ　反転"
            self.questionList = QuestionList().questionSetTreble2
        default:
            self.title = "DEMO"
            self.questionList = QuestionList().questionDummy
//            fatalError("Error:問題が存在しません")
        }
    }
    
    
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            
            VStack{
                Text("answer is " + (correct ? "correct" : "incorrect"))
                Text(question)
                Spacer()
                
                VStack{
                    HStack{
                        ForEach(0 ..< 3) {index in
                            Button(action: {
                                correct = answers[index] == answer
                                question = nextQuestion(question: questionList)
                                answer = questionList[question]!
                            }, label: {
                                Image(answers[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                            })
                        }
                    }
                    HStack{
                        ForEach(3 ..< 7) {index in
                            Button(action: {
                                correct = answers[index] == answer
                                question = nextQuestion(question: questionList)
                                answer = questionList[question]!
                            }, label: {
                                Image(answers[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                            })
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
            .navigationTitle(title)
            .onAppear{
                question = nextQuestion(question: questionList)
                answer = questionList[question]!
            }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(text: "demo")
    }
}

func nextQuestion(question: [String:String]) -> String{
        if let random = question.randomElement(){
            return random.key
        }
    fatalError("Error:問題が存在しません")
}
