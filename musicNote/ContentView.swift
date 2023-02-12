//
//  ContentView.swift
//  musicNote
//
//  Created by shiki on 2022/09/17.
//

import SwiftUI



struct ContentView: View {
    @State var isActive = false
    
    var body: some View {
        NavigationView{
            ZStack{
                
//                p075,いつかの街
                Color(red: 0.91, green: 0.91, blue: 0.91)
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    Spacer()
                    
                    LazyVGrid(columns: [.init(), .init()]) {
//                        NavigationLink(destination: QuestionView(text: "treble")) {
//                            Image("ト音記号ボタン")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 100, height: 80)
//                        }
//                        NavigationLink(destination: QuestionView(text: "bass")) {
//                            Image("ヘ音記号ボタン")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 100, height: 80)
//
//                        }
                        Button(action: {
                            self.isActive = true
                        }) {
                            Text("テスト")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    )
                        }
                        NavigationLink(destination: QuestionView(text: "treble"), isActive: $isActive) {
                            
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
