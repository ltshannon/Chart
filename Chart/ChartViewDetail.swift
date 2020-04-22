//
//  ChartViewDetail.swift
//  Chart
//
//  Created by Larry Shannon on 4/17/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI
import Charts

struct ChartViewDetail: View {
    @ObservedObject var model : VirusTrackerViewModel
    let name: String
    @State var index = 0
    @State var lineGraph: Bool = true
        
    var body: some View {
        GeometryReader { p in
            VStack {
                HStack {
                    Button(action: {
                        self.index = 0
                    }) {
                        VStack{
                            Text("Cases")
                                .foregroundColor(.black)
                                .fontWeight(self.index == 0 ? .bold : .none)
                                .frame(width: 90)
                            Capsule().fill(self.index == 0 ? Color.red : Color.clear)
                                .frame(height: 4)
                            }
                    }
                    Button(action: {
                        self.index = 1
                    }) {
                        VStack{
                            Text("Deaths")
                                .foregroundColor(.black)
                                .fontWeight(self.index == 1 ? .bold : .none)
                                .frame(width: 90)
                            Capsule().fill(self.index == 1 ? Color.red : Color.clear)
                                .frame(height: 4)
                        }
                    }
                    Button(action: {
                        self.index = 2
                    }) {
                        VStack{
                            Text("New Cases")
                                .foregroundColor(.black)
                                .fontWeight(self.index == 2 ? .bold : .none)
                                .frame(width: 100)
                            Capsule().fill(self.index == 2 ? Color.red : Color.clear)
                                .frame(height: 4)
                        }
                    }
                    Button(action: {
                        self.index = 3
                    }) {
                        VStack{
                            Text("New Deaths")
                                .foregroundColor(.black)
                                .fontWeight(self.index == 3 ? .bold : .none)
                                .frame(width: 100)
                            Capsule().fill(self.index == 3 ? Color.red : Color.clear)
                                .frame(height: 4)
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(self.model.startDate)
                        .font(.footnote)
                        .padding(.leading)
                    Spacer()
                    Text(self.model.endDate)
                        .font(.footnote)
                        .padding(.trailing)
                }
                if self.lineGraph {
                    LineChartSwiftUI(nydata: self.model.virusTrackerDataSet, index: self.index)
                        .frame(width: p.size.width, height: p.size.height-80, alignment: .center)
                } else {
                    BarChartSwiftUI(nydata: self.model.virusTrackerDataSet, index: self.index)
                        .frame(width: p.size.width, height: p.size.height-80, alignment: .center)
                }
/*
                PieChart(pieChartData: PieChartData(data: self.model.countryMaxCases, state: "US"))
                    .frame(width: p.size.width * 0.8, height: p.size.width * 0.8)
                    .padding(.top, 20)
                Spacer()
*/
            }
            .navigationBarTitle(Text(self.name), displayMode: .inline)
            .navigationBarItems(trailing:
                HStack {
                    if self.name == "United States" {
                    Button(action: {
                        self.model.fetchData()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                    }
                    Spacer()
                    }
                    Button(action: {
                        self.lineGraph.toggle()
                    }) {
                        if self.lineGraph {
                            Image("linegraph")
                                .resizable()
                        }
                        else {
                            Image("bargraph")
                                .resizable()
                        }
                    }
                }
            )
        }
    }
}

struct BarChartSwiftUI: UIViewRepresentable {
    let nydata: [NYTimesData]
    let index: Int
    let barChart = BarChartView()
    
    func makeUIView(context: UIViewRepresentableContext<BarChartSwiftUI>) -> BarChartView {
        setUpChart()
        return barChart
    }
    
    func updateUIView(_ uiView: BarChartView, context: UIViewRepresentableContext<BarChartSwiftUI>) {
        if nydata.count > 0 {
            barChart.noDataText = "No Data Available"
            let dataSets = [getLineChartDataSet()]
            let data = BarChartData(dataSets: dataSets)
            data.setValueFont(.systemFont(ofSize: 7, weight: .light))
             DispatchQueue.main.async {
                uiView.data = data
            }
        }
    }
    
    func setUpChart() {
        barChart.noDataText = "Waiting for data"
    }
    
    func getChartDataPoints(sessions: [Double], accuracy: [Double]) -> [ChartDataEntry] {
        var dataPoints: [BarChartDataEntry] = []
        for count in (0..<sessions.count) {
            let dataEntry = BarChartDataEntry(x: sessions[count], y: accuracy[count])
            dataPoints.append(dataEntry)
        }
        return dataPoints
    }

    func getLineChartDataSet() -> BarChartDataSet {
        var sessions: [Double] = []
        var accuracy: [Double] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLLL"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
            
        for i in 0...nydata.count - 1 {
            sessions.append(Double(i))
            if self.index == 0 {
                accuracy.append(Double(nydata[i].cases))
            } else if self.index == 1 {
                accuracy.append(Double(nydata[i].deaths))
            } else if self.index == 2 {
                accuracy.append(Double(nydata[i].newCases))
            } else {
                accuracy.append(Double(nydata[i].newDeaths))
            }
        }
        let dataPoints = getChartDataPoints(sessions:sessions, accuracy: accuracy)
        let set = BarChartDataSet(entries: dataPoints, label: self.index == 0 ? "Cases" : "Deaths")
/*
        set.lineWidth = 2.5
        set.circleRadius = 4
        set.circleHoleRadius = 2
        let color = ChartColorTemplates.vordiplom()[0]
        set.setColor(color)
        set.setCircleColor(color)
*/
        return set
    }
    
}

struct LineChartSwiftUI: UIViewRepresentable {
    let nydata: [NYTimesData]
    let index: Int
    let lineChart = LineChartView()

    func makeUIView(context: UIViewRepresentableContext<LineChartSwiftUI>) -> LineChartView {
        setUpChart()
        return lineChart
    }

    func updateUIView(_ uiView: LineChartView, context: UIViewRepresentableContext<LineChartSwiftUI>) {
        if nydata.count > 0 {
            lineChart.noDataText = "No Data Available"
            let dataSets = [getLineChartDataSet()]
            let data = LineChartData(dataSets: dataSets)
            data.setValueFont(.systemFont(ofSize: 7, weight: .light))
             DispatchQueue.main.async {
                uiView.data = data
            }
        }
    }

    func setUpChart() {

        lineChart.noDataText = "Waiting for data"
//        let dataSets = [getLineChartDataSet()]
//        let data = LineChartData(dataSets: dataSets)
//        data.setValueFont(.systemFont(ofSize: 7, weight: .light))
//        lineChart.data = data

    }
/*
    func getChartDataPoints(sessions: [Int], accuracy: [Double]) -> [ChartDataEntry] {
        var dataPoints: [ChartDataEntry] = []
        for count in (0..<sessions.count) {
            dataPoints.append(ChartDataEntry.init(x: Double(sessions[count]), y: accuracy[count]))
        }
        return dataPoints
    }
*/
    
    func getChartDataPoints(sessions: [Double], accuracy: [Double]) -> [ChartDataEntry] {
        var dataPoints: [ChartDataEntry] = []
        for count in (0..<sessions.count) {
            dataPoints.append(ChartDataEntry.init(x: sessions[count], y: accuracy[count]))
        }
        return dataPoints
    }

    func getLineChartDataSet() -> LineChartDataSet {
//        var sessions: [Int] = []
        var sessions: [Double] = []
        var accuracy: [Double] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLLL"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        for i in 0...nydata.count - 1 {
/*
            let timeIntervalForDate: TimeInterval = formatter.date(from: nydata[i].date)!.timeIntervalSince1970
            let monthString = monthFormatter.string(from: formatter.date(from: nydata[i].date)!)
            if let dayInt = Int(dayFormatter.string(from: formatter.date(from: nydata[i].date)!)) {
                sessions.append(dayInt)
            }
*/
            sessions.append(Double(i))
            if self.index == 0 {
                accuracy.append(Double(nydata[i].cases))
            } else if self.index == 1 {
                accuracy.append(Double(nydata[i].deaths))
            } else if self.index == 2 {
                accuracy.append(Double(nydata[i].newCases))
            } else {
                accuracy.append(Double(nydata[i].newDeaths))
            }
        }
        let dataPoints = getChartDataPoints(sessions:sessions, accuracy: accuracy)
        let set = LineChartDataSet(entries: dataPoints, label: self.index == 0 ? "Cases" : "Deaths")
    
        set.lineWidth = 2.5
        set.circleRadius = 4
        set.circleHoleRadius = 2
        let color = ChartColorTemplates.vordiplom()[0]
        set.setColor(color)
        set.setCircleColor(color)
        
        return set
    }
}


struct ChartViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChartViewDetail(model: VirusTrackerViewModel(), name: "")
    }
}
