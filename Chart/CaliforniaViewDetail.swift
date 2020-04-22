//
//  CaliforniaViewDetail.swift
//  Chart
//
//  Created by Larry Shannon on 4/19/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI

struct CaliforniaViewDetail: View {
    @ObservedObject var model: VirusTrackerViewModel
    let name: String

    var body: some View {
        VStack {
            ChartViewDetail(model: model, name: name)
        }
            .navigationBarTitle(Text(name), displayMode: .inline)
            .onAppear {
                self.model.getCountyData(county: self.name, type: "Cases")
            }
    }
}

struct CaliforniaViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CaliforniaViewDetail(model: VirusTrackerViewModel(), name: "")
    }
}
