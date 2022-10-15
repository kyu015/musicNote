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
    let answers: [String]
    
    @State var correct = true
    @State var showAnswerResult = false
    
    @State var question = ""
    @State var answer = ""
    
    @State var buttonValid = true
    
    @State var timer: Timer!
    @State var count: Int = 10
    
    @State var score: Int = 0
    
    init(text: String){
        self.text = text
        switch text{
        case "treble":
            self.title = "ド〜シ"
            self.questionList = QuestionList().questionSetTreble
            self.answers = QuestionList().answerSetTreble
        case "bass":
            self.title = "ド〜シ"
            self.questionList = QuestionList().questionSetBass
            self.answers = QuestionList().answerSetBass
        default:
            self.title = "DEMO"
            self.questionList = QuestionList().questionDummy
            self.answers = QuestionList().answerSetTreble
//            fatalError("Error:問題が存在しません")
        }
    }
    
    func showSymbol(index: Int){
        self.buttonValid = false
        self.correct = self.answers[index] == self.answer
        if self.correct {
            self.score += 1
        }
        self.showAnswerResult = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showAnswerResult = false
            self.question = nextQuestion(question: questionList)
            self.answer = questionList[question]!
            self.buttonValid = true
        }
    }
    
    func startCountUp(){
        // Timerの実態があるときは停止させる
        self.timer?.invalidate()
        // count初期化
        self.count = 10
        // Timer取得
        self.timer = Timer.scheduledTimer(withTimeInterval:1, repeats: true){ _ in
            self.count -= 1
            if self.count <= 0 {
                stop()
                dismiss()
            }
        }
    }
    
    func stop(){
        timer?.invalidate()
        timer = nil
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
                    HStack{
                        VStack(alignment: .leading){
                            Text("残り時間　" + String(count))
                            Text("スコア　　" + String(score))
                        }
                        Spacer()
                    }
                    
                    
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
                startCountUp()
            }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(text: "demo")
    }
}


