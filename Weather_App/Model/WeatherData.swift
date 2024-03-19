//
//  WeatherData.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 13/03/24.
//

import UIKit

struct WeatherData: Codable {
    
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct ReadyWeatherData: Codable {
    
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
        
        cityName = weatherData.name
        
        let weatherItem = weatherData.weather[0]
        
        weatherIconId = weatherItem.id
        description = weatherItem.description
        speed = weatherData.wind.speed
        humidity = weatherData.main.humidity
        pressure = weatherData.main.pressure
        feelsLikeTemperatura = weatherData.main.feels_like
        temperature = weatherData.main.temp
        minTemperature = weatherData.main.temp_min
        maxTemperature = weatherData.main.temp_max
    }
}
