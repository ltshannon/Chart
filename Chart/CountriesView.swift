//
//  CountriesView.swift
//  Chart
//
//  Created by Larry Shannon on 4/15/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    @ObservedObject var model: VirusTrackerViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Cases: \(model.totalCases) Deaths: \(model.totalDeaths)")
            }
            List {
                ForEach(self.model.countryArray, id: \.self) { country in
                    NavigationLink(destination: CountriesViewDetail(model: self.model, name: country)) {
                        HStack {
                            Image(self.getFlag(model: self.model, country: country).lowercased())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.black, width: 1)
                                .frame(height: 25)
                            Text(country)
                            Text("Cases: \(Int(self.model.countryMaxCases[self.getFlag(model: self.model, country: country)]!))")
                                .font(.caption)
                            Text("Deaths: \(Int(self.model.countryMaxDeaths[self.getFlag(model: self.model, country: country)]!))")
                                .font(.caption)
                            Spacer()
                        }
                    }
                }
            }
        }
            .navigationBarTitle(Text("Countries"), displayMode: .inline)
    }
    
    func getFlag(model: VirusTrackerViewModel, country: String)-> String {
        
        var code: String = ""
        for (key, value) in model.countries {
            if value == country {
                code = key
            }
        }
        
        return code
        
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(model: VirusTrackerViewModel())
    }
}
