//
//  ChartView.swift
//  Chart
//
//  Created by Larry Shannon on 4/15/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI
import Charts

struct ChartView: View {
    @ObservedObject var model : VirusTrackerViewModel
    
    var body: some View {
        VStack {
            ChartViewDetail(model: model, name: "United States")
        }
        .onAppear {
            self.model.getCountryData(country: "United States", type: "Cases")
        }
    }

}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(model : VirusTrackerViewModel())
    }
}
