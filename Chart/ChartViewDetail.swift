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
    @State var graph = 0
    @State private var xValue: Double = 0
    @State var v = 0
        
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
                    Text(self.model.virusTrackerDataSet.count > 0 ? self.model.virusTrackerDataSet[Int(self.xValue)].date : "")
                        .font(.footnote)
                        .padding(.leading)
                    Spacer()
                    Text(self.model.endDate)
                        .font(.footnote)
                        .padding(.trailing)
                }
                if self.graph == 0 {
                    LineChartSwiftUI(nydata: self.model.virusTrackerDataSet, index: self.index, start: Int(self.xValue))
                        .frame(width: p.size.width, height: p.size.height-150, alignment: .center)
                } else if self.graph == 1 {
                    BarChartSwiftUI(nydata: self.model.virusTrackerDataSet, index: self.index, start: Int(self.xValue))
                        .frame(width: p.size.width, height: p.size.height-150, alignment: .center)
                } else {
                    LineChartSwiftUI(nydata: self.model.virusTrackerDataSet, index: self.newOrNot() ? 5 : 4, start: Int(self.xValue))
                        .frame(width: p.size.width, height: p.size.height-150, alignment: .center)
                }
                Slider(value: self.$xValue, in: 0...Double(self.model.virusTrackerDataSet.count > 0 ? self.model.virusTrackerDataSet.count - 1 : 0 ))
                    .padding()
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
                        self.graph += 1
                        if self.graph > 2 {
                            self.graph = 0
                        }
                    }) {
                        if self.graph == 0 {
                            Image("linegraph")
                                .resizable()
                        }
                        else if self.graph == 1 {
                            Image("bargraph")
                                .resizable()
                        }
                        else {
                            Image("doubleGraph")
                                .resizable()
                        }
                    }
                }
            )
        }
    }
    
    func newOrNot()-> Bool {
        
        if self.index == 0 || self.index == 1 {
            return false
        } else {
            return true
        }
        
    }
    
}

struct BarChartSwiftUI: UIViewRepresentable {
    let nydata: [NYTimesData]
    let index: Int
    let barChart = BarChartView()
    let start: Int
    
    func makeUIView(context: UIViewRepresentableContext<BarChartSwiftUI>) -> BarChartView {
        setUpChart()
        return barChart
    }
    
    func updateUIView(_ uiView: BarChartView, context: UIViewRepresentableContext<BarChartSwiftUI>) {
        if nydata.count > 0 {
            barChart.noDataText = "No Data Available"
            let dataSets = [getLineChartDataSet(dataType: self.index)]
            let data = BarChartData(dataSets: dataSets)
            data.setValueFont(.systemFont(ofSize: 7, weight: .light))
            barChart.animate(xAxisDuration: 2.5)
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

    func getLineChartDataSet(dataType: Int) -> BarChartDataSet {
        var sessions: [Double] = []
        var accuracy: [Double] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLLL"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
            
        for i in start...nydata.count - 1 {
            
            sessions.append(Double(i))
            
            if dataType == 0 {
                accuracy.append(Double(nydata[i].cases))
            } else if dataType == 1 {
                accuracy.append(Double(nydata[i].deaths))
            } else if dataType == 2 {
                accuracy.append(Double(nydata[i].newCases))
            } else {
                accuracy.append(Double(nydata[i].newDeaths))
            }

        }
        
        var str = ""
        
        switch self.index {
        case 0:
            str = "Cases"
        case 1:
            str = "Deaths"
        case 2:
            str = "New Cases"
        case 3:
            str = "New Deaths"
        default:
            str = ""
        }
        
        let dataPoints = getChartDataPoints(sessions:sessions, accuracy: accuracy)
        let set = BarChartDataSet(entries: dataPoints, label: str)

        return set
    }
    
}

struct LineChartSwiftUI: UIViewRepresentable {
    let nydata: [NYTimesData]
    let index: Int
    let lineChart = LineChartView()
    let start: Int

    func makeUIView(context: UIViewRepresentableContext<LineChartSwiftUI>) -> LineChartView {
        setUpChart()
        return lineChart
    }

    func updateUIView(_ uiView: LineChartView, context: UIViewRepresentableContext<LineChartSwiftUI>) {
        if nydata.count > 0 {
            print(nydata.count)
            lineChart.noDataText = "No Data Available"
            
            var data: ChartData
            var dataSets: [LineChartDataSet]
            if self.index < 4 {
                dataSets = [getLineChartDataSet(dataType: self.index)]
            } else if self.index == 4 {
                dataSets = [getLineChartDataSet(dataType: 4), getLineChartDataSet(dataType: 5)]
            } else {
                dataSets = [getLineChartDataSet(dataType: 6), getLineChartDataSet(dataType: 7)]
            }
            data = LineChartData(dataSets: dataSets)
            data.setValueFont(.systemFont(ofSize: 7, weight: .light))
            self.lineChart.animate(xAxisDuration: 2.5)
             DispatchQueue.main.async {
                uiView.data = data
            }
        }
    }

    func setUpChart() {
        lineChart.noDataText = "Waiting for data"
    }
    
    func getChartDataPoints(sessions: [Double], accuracy: [Double]) -> [ChartDataEntry] {
        var dataPoints: [ChartDataEntry] = []
        for count in (0..<sessions.count) {
            dataPoints.append(ChartDataEntry.init(x: sessions[count], y: accuracy[count]))
        }
        return dataPoints
    }

    func getLineChartDataSet(dataType: Int) -> LineChartDataSet {
//        var sessions: [Int] = []
        var sessions: [Double] = []
        var accuracy: [Double] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLLL"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        for i in start...nydata.count - 1 {

            sessions.append(Double(i))
            
            switch dataType {
            case 0, 4:
                accuracy.append(Double(nydata[i].cases))
            case 1, 5:
                accuracy.append(Double(nydata[i].deaths))
            case 2, 6:
                accuracy.append(Double(nydata[i].newCases))
            case 3, 7:
                accuracy.append(Double(nydata[i].newDeaths))
            default:
                accuracy.append(Double(nydata[i].cases))
            }
        }
        
        let dataPoints = getChartDataPoints(sessions:sessions, accuracy: accuracy)
        
        var str = ""
        
        switch dataType {
        case 0, 4:
            str = "Cases"
        case 1, 5:
            str = "Deaths"
        case 2, 6:
            str = "New Cases"
        case 3, 7:
            str = "New Deaths"
        default:
            str = ""
        }
        
        let set = LineChartDataSet(entries: dataPoints, label: str)

        set.lineWidth = 2
        set.circleRadius = 3
        
        if dataType == 5 || dataType == 7 {
            set.setColor(.red)
            set.setCircleColor(.blue)
        }
        else {
            set.setColor(.yellow)
            set.setCircleColor(.black)
        }
        
        return set
    }
}


struct ChartViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChartViewDetail(model: VirusTrackerViewModel(), name: "")
    }
}
