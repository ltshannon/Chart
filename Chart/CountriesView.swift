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
    @State var index = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.model.sort(sortBy: .country)
                self.index = 0
            }) {
                VStack {
                    HStack {
                        Text("Country: \(model.globalStats.total_affected_countries)")
                            .fontWeight(self.index == 0 ? .bold : .none)
                            .foregroundColor(.black)
                            .frame(width: 115)
                        if index == 0 {
                            Image(systemName: model.countryArrow ? "arrow.up" : "arrow.down")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 15, height: 15, alignment: .leading)
                        }
                    }
                    Capsule().fill(self.index == 0 ? Color.black : Color.clear)
                        .frame(width: 125, height: 4)
                }

            }
            HStack {
                Button(action: {
                    self.model.sort(sortBy: .cases)
                    self.index = 1
                }) {
                    VStack {
                        HStack {
                            Text("Cases: \(model.globalStats.total_cases)")
                            if index == 1 {
                            Image(systemName: model.casesArrow ? "arrow.up" : "arrow.down")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .leading)
                                .foregroundColor(.black)
                            }
                        }
                        Capsule().fill(self.index == 1 ? Color.black : Color.clear)
                            .frame(width: 125, height: 4)
                    }
                }
                Button(action: {
                    self.model.sort(sortBy: .deaths)
                    self.index = 2
                }) {
                    VStack {
                        HStack {
                            Text("Deaths: \(model.globalStats.total_deaths)")
                            if index == 2 {
                                Image(systemName: model.casesArrow ? "arrow.up" : "arrow.down")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .leading)
                                    .foregroundColor(.black)
                            }
                        }
                        Capsule().fill(self.index == 2 ? Color.black : Color.clear)
                            .frame(width: 125, height: 4)
                    }
                }
            }
            List {
                ForEach(self.model.countryArray, id: \.self) { country in
                    NavigationLink(destination: CountriesViewDetail(model: self.model, name: country.name)) {
                        HStack {
                            Image(self.getFlag(model: self.model, country: country.name).lowercased())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.black, width: 1)
                                .frame(height: 25)
                            Text(country.name)
                            Text("Cases: \(Int(self.model.countryMaxCases[self.getFlag(model: self.model, country: country.name)]!))")
                                .font(.caption)
                            Text("Deaths: \(Int(self.model.countryMaxDeaths[self.getFlag(model: self.model, country: country.name)]!))")
                                .font(.caption)
                            Spacer()
                        }
                    }
                }
            }
        }
            .navigationBarTitle(Text("World"), displayMode: .inline)
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
