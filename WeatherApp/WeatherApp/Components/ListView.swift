//
//  ListView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-04-02.
//

import SwiftUI

struct ListView: View {
    let weather = WeatherGetter()
    @State var cities: [String] = ["Toronto", "Cancun", "London"]
    @State var temps = [Double](repeating: 0.0, count: 3)
    @State var feelsLikeTemps = [Double](repeating: 0.0, count: 3)
    @State var lowTemps = [Double](repeating: 0.0, count: 3)
    @State var highTemps = [Double](repeating: 0.0, count: 3)
    @State var weatherImage: String = "cloud.fill"
    
    @ViewBuilder
    var body: some View {
        List {
            ForEach (0...2, id: \.self) { index in
                Button {
                    print("Hello")
                } label: {
                    MiniWeatherView(
                        city: $cities[index],
                        curTemp: $temps[index],
                        feelsLike: $feelsLikeTemps[index],
                        lowTemp: $lowTemps[index],
                        highTemp: $highTemps[index]
                    )
                }
                .foregroundColor(.black)
                .onAppear {
                    weather.getWeather(city: cities[index]) {
                        useData(i: index)
                    }
                }
            }
        }
    }
    
    func useData(i: Int) {
        weather.printWeatherData()
        
        temps[i] = weather.temp
        feelsLikeTemps[i] = weather.feelsLike
        lowTemps[i] = weather.tempMin
        highTemps[i] = weather.tempMax
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
