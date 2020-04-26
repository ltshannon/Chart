//
//  LATimesViewModel.swift
//  Chart
//
//  Created by Larry Shannon on 4/18/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import Foundation

struct LATimesData: Decodable, Hashable  {
    let date: String
    let county: String
    let fips: Int
    let cases: Int
    let deaths: Int
    let newCases: Int
    let newDeaths: Int
    
    init(date: String, county: String, fips: Int, cases: Int, deaths: Int, newCases: Int, newDeaths: Int) {
        self.date = date
        self.county = county
        self.fips = fips
        self.cases = cases
        self.deaths = deaths
        self.newCases = newCases
        self.newDeaths = newDeaths
    }
}

class LATimesViewModel: ObservableObject {
    @Published var laTimesDataSet: [LATimesData] = []
    
    var countyMaxDeaths: [String : Double] = [:]
    var countyMaxCases: [String : Double] = [:]
    var countiesDeathsTotals: Double = 0
    var countiesCasesTotals: Double = 0
    var laTimesArray: [LATimesData] = []
    var countySet: Set<String> = []
    @Published var countyArray: [String] = []
    @Published var nyTimesArray: [NYTimesData] = []
    var temp: [String : Double] = [:]
    var startDate: String = ""
    var endDate: String = ""
    
    init() {
        fetchData()
    }
 
    func fetchData() {
        let urlString = "https://raw.githubusercontent.com/datadesk/california-coronavirus-data/master/latimes-county-totals.csv"
        
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            if let htmlContentString = String.init(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                let dataArr = htmlContentString.components(separatedBy: "\n").map({ $0.components(separatedBy: ",") })

                    let df = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd"
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM-dd-yyyy"
                    for row in dataArr
                    {
                        if row[0] == "date" {
                            continue
                        }
                        var date: String = ""
                        var county: String = ""
                        var fips: Int = 0
                        var cases: Int = 0
                        var deaths: Int = 0
                        var newCases: Int = 0
                        var newDeaths: Int = 0

                        if row.count > 6 {
                            if let d = df.date(from: row[0]) {
                                date = formatter.string(from: d)
                            }
                            county = row[1]
                            self.countySet.insert(county)
                            if let num = Int(row[2]) {
                                fips = num
                            }
                            if let num = Int(row[3]) {
                                cases = num
                            }
                            if let num = Int(row[4]) {
                                deaths = num
                            }
                            if let num = Int(row[5]) {
                                newCases = num
                            }
                            if let num = Int(row[6]) {
                                newDeaths = num
                            }
                        }
                        
                        if cases == 0 && deaths == 0 {
                            continue
                        }
                            
                        if let s = self.countyMaxDeaths[county] {
                            self.countyMaxDeaths[county] = s + Double(deaths)
                        } else {
                            self.countyMaxDeaths[county] = Double(deaths)
                        }
                        if let s = self.countyMaxCases[county] {
                            self.countyMaxCases[county] = s + Double(cases)
                        } else {
                            self.countyMaxCases[county] = Double(cases)
                        }
                            
                        let item = LATimesData(date: date, county: county, fips: fips, cases: cases, deaths: deaths, newCases: newCases, newDeaths: newDeaths)
                            
                        self.laTimesArray.append(item)

                    }
                
                    self.countiesDeathsTotals = self.countyMaxDeaths.values.reduce(0) { $0 + $1}
                    self.countiesCasesTotals = self.countyMaxCases.values.reduce(0) { $0 + $1}

                    DispatchQueue.main.async {
                        self.countyArray = Array(self.countySet)
                        self.countyArray.sort()
                        self.laTimesDataSet = self.laTimesArray
                    }
                }
                else {
                    print("Could not create html content string from data")
                }

            }.resume()
        
    }
    
    func getCountyData(county: String, type: String) {
        
        self.nyTimesArray.removeAll()
        
        if countyArray.count == 0 {
            return
        }


        for i in 0...laTimesArray.count-1 {
            let a = type == "Deaths" ? laTimesArray[i].deaths > 0 : laTimesArray[i].cases > 0
            if laTimesArray[i].county == county && a {
                let item = NYTimesData(date: laTimesArray[i].date, state: laTimesArray[i].county, fips: laTimesArray[i].fips, cases: laTimesArray[i].cases, deaths: laTimesArray[i].deaths, newCases: laTimesArray[i].newCases, newDeaths: laTimesArray[i].newDeaths)
                self.nyTimesArray.append(item)
            }
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        
        self.nyTimesArray.sort{formatter.date(from: $0.date)! < formatter.date(from:$1.date)!}
        
        if let d = self.nyTimesArray.first?.date {
            self.startDate = d
        }
        
        if let d = self.nyTimesArray.last?.date {
            self.endDate = d
        }
        
        DispatchQueue.main.async {
//            self.laTimesDataSet = self.nyTimesArray
        }

    }
    
}
