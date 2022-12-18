//
//  sample.swift
//  musicNote
//
//  Created by shiki on 2022/12/18.
//

import SwiftUI

struct sample: View {
    var body: some View {
        VStack(spacing: 0) {
                    // 五線を表現するためのHStackを作成
                    HStack(spacing: 0) {
                        // 五線を表すための線を配置
                        ForEach(0..<5, id: \.self) { _ in
                            Rectangle()
                                .frame(height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(height: 100)

                    // ドの四分音符を表現するためのビューを作成
                    ZStack(alignment: .center) {
                        // 音符を表す円を作成
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .offset(x: 0, y: -50) // 五線の上に配置するために、y座標を少し上にずらす

                        // 白い円を重ねることで、音符の印を作成
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                            .offset(x: 0, y: -50) // 五線の上に配置するために、y座標を少し上にずらす
                    }
                }
    }
}

struct sample_Previews: PreviewProvider {
    static var previews: some View {
        sample()
    }
}
