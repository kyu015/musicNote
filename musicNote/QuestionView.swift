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
    @State var showAnswerResult = false
    
    @State var question = ""
    @State var answer = ""
    
    @State var buttonValid = true
    
    init(text: String){
        self.text = text
        switch text{
        case "treble":
            self.title = "ド〜シ"
            self.questionList = QuestionList().questionSetTreble
        case "bass":
            self.title = "ド〜シ"
            self.questionList = QuestionList().questionSetBass
        default:
            self.title = "DEMO"
            self.questionList = QuestionList().questionDummy
//            fatalError("Error:問題が存在しません")
        }
    }
    
    func showSymbol(index: Int){
        self.buttonValid = false
        self.correct = self.answers[index] == self.answer
        self.showAnswerResult = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showAnswerResult = false
            self.question = nextQuestion(question: questionList)
            self.answer = questionList[question]!
            self.buttonValid = true
        }
    }
    
    func nextQuestion(question: [String:String]) -> String{
            if let random = question.randomElement(){
                return random.key
            }
        fatalError("Error:問題が存在しません")
    }
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            
            ZStack{
                
                VStack{
                    if showAnswerResult {
                        if correct {
                            Image("マル")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                        }else {
                            Image("バツ")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                        }
                    }
                    Spacer()
                }
                
                VStack{
                    Image(question)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            ForEach(0 ..< 3) {index in
                                Button(action: {
                                    if buttonValid {
                                        showSymbol(index: index)
                                    }
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
                                    if buttonValid {
                                        showSymbol(index: index)
                                    }
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
                
            }
            

        }.navigationBarBackButtonHidden(true)
//            .navigationTitle(title)
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


