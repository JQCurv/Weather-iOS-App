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
    
    init (cities: [String]) {
        self.cities = cities
        temps = [Double](repeating: 0, count: cities.count)
        feelsLikeTemps = [Double](repeating: 0, count: cities.count)
        lowTemps = [Double](repeating: 0, count: cities.count)
        highTemps = [Double](repeating: 0, count: cities.count)
        images = [String](repeating: "", count: cities.count)
        imageColors = [Color](repeating: Color.gray, count: cities.count)
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
            
            //MARK: debug code
            print("city: \(self.cities[i]) \t weather: \(self.weather.weatherMain)")
//            print("date: \(unixToDate(unixTime: self.weather.dateAndTime))")
//            print("Stuff \(self.weather.weatherMain)")
//            self.weather.printWeatherData()
        }
    }
}

extension ListViewModel {
    public static var mock: ListViewModel = ListViewModel(cities: ["Toronto"])
}
