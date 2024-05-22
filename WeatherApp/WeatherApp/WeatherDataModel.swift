//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Hedrich Fernando on 17/02/23.
//

import Foundation

struct WeatherDataModel {
    let name:String
    let description:String
    let temp : Double
    let pressure : Int
    let humidity : Int
    let feelsLike : Double
    let visibility:Int
    let windSpeed:Double
    let cloudPercentage:Int
    
//  computed property
    var formattedTemp : String{
        return String(format: "%.1f", temp)
    }
}
