//
//  NetworkStore.swift
//  WeatherApp
//
//  Created by Hedrich Fernando on 17/02/23.
//

import Foundation

// ObservableObject used to mark that the ui will update
class NetworkStore: ObservableObject {
    
//    this will be used to update the UI
    @Published var weatherData:WeatherDataModel?
    
    private var baseUrl = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.KEY)&units=metric"
    
    func fetchData(cityName:String) async {
        
        // addingPercentEncoding - replace empty spaces with %20 to represent empty spaces
        let urlString = "\(baseUrl)&q=\(cityName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        // URL
        guard let url = URL(string: urlString) else {
            print("Invald URL")
            return
        }
        
        // URLSession
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode
            let decodableData = try JSONDecoder().decode(WeatherDTO.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherData = WeatherDataModel(name: decodableData.name,
                                                    description: decodableData.weather[0].description.capitalized,
                                                    temp: decodableData.main.temp,
                                                    pressure: decodableData.main.pressure,
                                                    humidity: decodableData.main.humidity,
                                                    feelsLike: decodableData.main.feelsLike,
                                                    visibility: decodableData.visibility,
                                                    windSpeed: decodableData.wind.speed,
                                                    cloudPercentage: decodableData.clouds.all)
            }
        }catch{
            print("Error")
        }
        
        
        
        
    }
}
