//
//  CountriesViewDetail.swift
//  Chart
//
//  Created by Larry Shannon on 4/17/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI

struct CountriesViewDetail: View {
    @ObservedObject var model: VirusTrackerViewModel
    let name: String
    
    var body: some View {
        VStack {
            ChartViewDetail(model: model, name: name)
        }
            .navigationBarTitle(Text(name), displayMode: .inline)
            .onAppear {
                self.model.getCountryData(country: self.name, type: "Cases")
            }
    }
}

struct CountriesViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountriesViewDetail(model: VirusTrackerViewModel(), name: "")
    }
}
