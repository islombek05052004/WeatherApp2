//
//  WeatherModel.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

struct ForecastData: Codable {
    
    let list: [List]
    let city: City
}

struct List: Codable {
    
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let dt_txt: String
}

struct Main: Codable {
    
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    
    let id: Int
    let main: String
    let description: String
}

struct Wind: Codable {
    
    let speed: Double
}

struct City: Codable {
    
    let name: String
}



struct ForecastReadyData: Codable {
    
    let description: String
    private let temperature: Double
    let weatherIconId: Int
    let date: String
//    private let speed: Double
//    private let humidity: Int
//    private let pressure: Int
//    private let feelsLikeTemperatura: Double
//    private let minTemperature: Double
//    private let maxTemperature: Double

    var weatherIconImageName: String {
        
        switch weatherIconId {
        case 200...232: return "storm"
        case 300...321: return "rainy"
        case 500...531: return "cloudy"
        case 600...622: return "snowy"
        case 700...781: return "wind"
        case 800: return "sunny"
        case 801...804: return "sun"
        default: return "null"
        }
    }
    
//    var speedString: String {
//
//        return "\(speed) km/h"
//    }
    
    var temperatureString: String {
        
        return "\(Int(temperature.rounded()) - 273)˚"
    }
    
    init?(list: List) {
        self.date = list.dt_txt
        self.description = list.weather[0].description
        self.temperature = list.main.temp
        self.weatherIconId = list.weather[0].id
        
    }

//    var feelsLikeTemperaturaString: String {
//
//        return "Feel like : \(Int(feelsLikeTemperatura.rounded()) - 273)˚C"
//    }
    
//    var minMaxTemperatureString: String {
//
//        let minTemp = Int(minTemperature.rounded() - 273)
//        let maxTemp = Int(maxTemperature.rounded() - 273)
//
//        return "\(minTemp)˚  |  \(maxTemp)˚"
//    }

//    var pressureString: String {
//        return "\(pressure) mb"
//    }
//
//    var himidityString: String {
//        return "\(humidity)%"
//    }
}
