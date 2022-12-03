//
//  ProgressBarView.swift
//  najahni
//
//  Created by najahni on 3/12/2022.
//

import SwiftUI

struct ProgressBarView: View {
    @State var progress: Float = 0.1
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.1)
                .foregroundColor(Color("primaryColor"))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("primaryColor"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.system(size: 16))
                .bold()
        }
        .padding(.all)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
