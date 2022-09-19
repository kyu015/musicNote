//
//  ContentView.swift
//  musicNote
//
//  Created by shiki on 2022/09/17.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                
//                p075,いつかの街
                Color(red: 0.91, green: 0.91, blue: 0.91)
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    
                    LazyVGrid(columns: [.init(), .init()]) {
                        NavigationLink(destination: QuestionView(text: "Page 1")) {
                            Image("ト音記号ボタン")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 80)
                        }
                        NavigationLink(destination: QuestionView(text: "Page 2")) {
                            Image("ヘ音記号ボタン")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 80)
                            
                        }
                        NavigationLink(destination: QuestionView(text: "Page 3")) {
                            Image("白ボタン素材")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 80)
                        }
                        NavigationLink(destination: QuestionView(text: "Page 4")) {
                            Image("白ボタン素材")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 80)
    //                        GroupBox("ラベル1"){
    //                            // Textを1つ配置する場合
    //                            Text("テキスト2-1")
    //                        }
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
