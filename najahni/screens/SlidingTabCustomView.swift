//
//  SlidingTabCustomView.swift
//  najahni
//
//  Created by najahni on 30/11/2022.
//

import SwiftUI
import SlidingTabView

struct SlidingTabCustomView: View {
    @State private var selectedTabIndex = 0
    var body: some View {
        VStack(alignment: .leading) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Courses", "Archived"])
                    (selectedTabIndex == 0 ? Text("First View") : Text("Second View")).padding()
                    Spacer()
                }
                    .padding(.top, 50)
                    .animation(.none)
    }
}

struct SlidingTabCustomView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingTabCustomView()
    }
}
