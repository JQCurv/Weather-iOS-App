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
    
    init (cities: [String]) {
        self.cities = cities
        temps = [Double](repeating: 0, count: cities.count)
        feelsLikeTemps = [Double](repeating: 0, count: cities.count)
        lowTemps = [Double](repeating: 0, count: cities.count)
        highTemps = [Double](repeating: 0, count: cities.count)
    }
    
    func useData(i: Int) {
        self.weather.getWeather(city: cities[i]) {
            self.temps[i] = self.weather.temp
            self.feelsLikeTemps[i] = self.weather.feelsLike
            self.lowTemps[i] = self.weather.tempMin
            self.highTemps[i] = self.weather.tempMax
            
            self.weather.printWeatherData()
        }
    }
}

extension ListViewModel {
    public static var mock: ListViewModel = ListViewModel(cities: ["Toronto"])
}
