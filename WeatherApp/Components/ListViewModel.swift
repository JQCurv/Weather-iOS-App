//
//  ListViewModel.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-04-02.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    let weather = WeatherGetter()
    @Published var cities: [String]
    @Published var temps = [Double]()
    @Published var feelsLikeTemps = [Double]()
    @Published var lowTemps = [Double]()
    @Published var highTemps = [Double]()
    @Published var images = [String]()
    @Published var imageColors = [Color]()
    @Published var sunriseTimes = [(hours: Int, minutes: Int)]()
    @Published var sunsetTimes = [(hours: Int, minutes: Int)]()
    
    init (cities: [String]) {
        self.cities = cities
        temps = [Double](repeating: 0, count: cities.count)
        feelsLikeTemps = [Double](repeating: 0, count: cities.count)
        lowTemps = [Double](repeating: 0, count: cities.count)
        highTemps = [Double](repeating: 0, count: cities.count)
        images = [String](repeating: "", count: cities.count)
        imageColors = [Color](repeating: Color.gray, count: cities.count)
        sunriseTimes = [(hours: Int, minutes: Int)](repeating: (0, 0), count: cities.count)
        sunsetTimes = [(hours: Int, minutes: Int)](repeating: (0, 0), count: cities.count)
    }
    
    func setWeatherImage(i: Int) {
        switch weather.weatherMain {
        case "Clear":
            self.images[i] = "sun.max"
            self.imageColors[i] = Color.yellow
        case "Clouds":
            self.images[i] = "cloud.fill"
            self.imageColors[i] = Color.gray
        case "Rain":
            self.images[i] = "cloud.rain.fill"
            self.imageColors[i] = Color.blue
        case "Haze":
            self.images[i] = "sun.haze"
            self.imageColors[i] = Color.gray
        case "Smoke":
            self.images[i] = "smoke.fill"
            self.imageColors[i] = Color.black
        case "Mist":
            self.images[i] = "cloud.fill"
            self.imageColors[i] = Color.blue
        default:
            self.images[i] = "cloud.fill"
            self.imageColors[i] = Color.yellow
        }
    }
    
    func useData(i: Int) {
        self.weather.getWeather(city: cities[i]) {
            self.temps[i] = self.weather.temp
            self.feelsLikeTemps[i] = self.weather.feelsLike
            self.lowTemps[i] = self.weather.tempMin
            self.highTemps[i] = self.weather.tempMax
            
            self.setWeatherImage(i: i)
            
            self.sunriseTimes[i] = dateToTime(unixTime: self.weather.sunrise, timeZone: self.weather.timezone)
            self.sunsetTimes[i] = dateToTime(unixTime: self.weather.sunset, timeZone: self.weather.timezone)

            //MARK: debug code
//            let sunrise = dateToTime(unixTime: self.weather.sunrise, timeZone: self.weather.timezone)
//            let sunset = dateToTime(unixTime: self.weather.sunset, timeZone: self.weather.timezone)
//            print("city:\(self.cities[i]) \t sunrise: \(String(format: "%d:%02d", sunrise.hours, sunrise.minutes)) \t sunset: \(String(format: "%d:%02d", sunset.hours, sunset.minutes))")
        }
    }
}

extension ListViewModel {
    public static var mock: ListViewModel = ListViewModel(cities: ["Toronto"])
}
