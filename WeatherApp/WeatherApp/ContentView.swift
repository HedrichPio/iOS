//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hedrich Fernando on 17/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView().tabItem{
                Label("Home",systemImage: "house")
            }
            
            SearchView().tabItem{
                Label("Search",systemImage: "magnifyingglass")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
