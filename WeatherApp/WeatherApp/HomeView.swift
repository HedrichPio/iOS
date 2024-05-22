//
//  HomeView.swift
//  WeatherApp
//
//  Created by Hedrich Fernando on 17/02/23.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var networkStore = NetworkStore()

    var body: some View {
        VStack(spacing: 20){
            
            if let weatherData = networkStore.weatherData{
                
                Text("\(weatherData.name)")
                    .font(.title)
                
                Text("\(Date().formatted())")
                
                Text("\(weatherData.formattedTemp)")
                    .font(.system(size: 70))
                    .bold()
                
                Text("\(weatherData.description)")
                    .font(.title)
            } else{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
        }
        .task {
            await networkStore.fetchData(cityName: "colombo")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
