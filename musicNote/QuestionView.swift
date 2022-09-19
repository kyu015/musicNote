//
//  QuestionView.swift
//  musicNote
//
//  Created by shiki on 2022/09/19.
//

import SwiftUI

struct QuestionView: View {
    var text: String
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("QuestionView").font(.title)
            .navigationBarBackButtonHidden(true)
        Button(action: {
            dismiss()
        }, label: {
            Text(text)
        })
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(text: "demo")
    }
}
