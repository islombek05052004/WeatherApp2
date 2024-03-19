//
//  WeatherModel.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

struct WeatherData: Codable {
    
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



struct WeatherReadyData {
    
    let cityName: String
    let description: String

    private let weatherIconId: Int
    private let speed: Double
    private let humidity: Int
    private let pressure: Int
    private let feelsLikeTemperatura: Double
    private let temperature: Double
    private let minTemperature: Double
    private let maxTemperature: Double

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
    
    var speedString: String {
        
        return "\(speed) km/h"
    }
    
    var temperatureString: String {
        
        return "\(Int(temperature.rounded()) - 273)˚"
    }

    var feelsLikeTemperaturaString: String {
        
        return "Feel like : \(Int(feelsLikeTemperatura.rounded()) - 273)˚C"
    }
    
    var minMaxTemperatureString: String {
        
        let minTemp = Int(minTemperature.rounded() - 273)
        let maxTemp = Int(maxTemperature.rounded() - 273)
        
        return "\(minTemp)˚  |  \(maxTemp)˚"
    }

    var pressureString: String {
        return "\(pressure) mb"
    }
    
    var himidityString: String {
        return "\(humidity)%"
    }
    
    init?(weatherData: WeatherData) {
        
        cityName = weatherData.city.name
        
        let weatherListItem = weatherData.list[0]
        let weatherItem = weatherListItem.weather[0]
            
        weatherIconId = weatherItem.id
        description = weatherItem.description
        speed = weatherListItem.wind.speed
        humidity = weatherListItem.main.humidity
        pressure = weatherListItem.main.pressure
        feelsLikeTemperatura = weatherListItem.main.feels_like
        temperature = weatherListItem.main.temp
        minTemperature = weatherListItem.main.temp_min
        maxTemperature = weatherListItem.main.temp_max
    }
}
