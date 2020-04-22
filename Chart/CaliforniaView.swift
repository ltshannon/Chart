//
//  CaliforniaView.swift
//  Chart
//
//  Created by Larry Shannon on 4/18/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI

struct CaliforniaView: View {
    @ObservedObject var model: VirusTrackerViewModel
    var body: some View {
        VStack {
            List {
                ForEach(self.model.countyArray, id: \.self) { county in
                    NavigationLink(destination: CaliforniaViewDetail(model: self.model, name: county)) {
                        HStack {
                            Text(county)
                            Text("Cases: \(Int(self.model.countyMaxCases[county]!))")
                                .font(.caption)
                            Text("Deaths: \(Int(self.model.countyMaxDeaths[county]!))")
                                .font(.caption)
                            Spacer()
                        }
                    }
                }
            }
        }
            .navigationBarTitle(Text("California Cases: \(Int(model.countiesCasesTotals)) Deaths: \(Int(model.countiesDeathsTotals))"), displayMode: .inline)
    }
}

struct CaliforniaView_Previews: PreviewProvider {
    static var previews: some View {
        CaliforniaView(model: VirusTrackerViewModel())
    }
}
