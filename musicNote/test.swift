//
//  test.swift
//  musicNote
//
//  Created by shiki on 2022/12/18.
//

import SwiftUI



//struct test: View {
//    @State private var countDownValue: Int = 10
//    @State private var timer: Timer.TimerPublisher?
//
//    var body: some View {
//        if countDownValue > 0 {
//            Text("\(countDownValue)")
//                .font(.system(size: 60))
//                .opacity(0.3)
//                .scaleEffect(1.5)
//                .opacity(1)
//                .onAppear {
//                    timer = Timer.publish(every: 1, on: .main, in: .common)
//                        .autoconnect()
//                        .sink { _ in
//                            withAnimation(.linear(duration: 1)) {
//                                self.countDownValue -= 1
//                            }
//                            if self.countDownValue == 0 {
//                                self.timer?.upstream.connect().cancel()
//                            }
//                        }
//                }
//        } else {
//            Text("")
//        }
//    }
//}





struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
