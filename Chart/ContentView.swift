//
//  ContentView.swift
//  Chart
//
//  Created by Larry Shannon on 4/14/20.
//  Copyright © 2020 Larry Shannon. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var model = VirusTrackerViewModel()
    @State var selectedView = 0

    var body: some View {
    
        TabView(selection: $selectedView) {
            NavigationView {
                ChartView(model: model)
            }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image("us-small")
                    Text("USA")
                }.tag(0)
            NavigationView {
                CountriesView(model: model)
            }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image("world")
                    Text("World")
                }.tag(1)
            NavigationView {
                CaliforniaView(model: model)
            }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image("califorina")
                    Text("Califorina")
                }.tag(2)
            
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: VirusTrackerViewModel())
    }
}
