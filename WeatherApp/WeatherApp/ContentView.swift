//
//  ContentView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-02-15.
//  Inspired by article: https://www.globalnerdy.com/2016/04/02/how-to-build-an-ios-weather-app-in-swift-part-1-a-very-bare-bones-weather-app/

import SwiftUI

struct ContentView: View {
    let weather = WeatherGetter()
    @State var hasChanged: Bool = false
    @State var hasChanged2: Bool = false
    @State var city: String = "Toronto"
    @State var temp: Double = 0.0
    @State var lowTemp: Double = 0.0
    @State var highTemp: Double = 0.0
    @State var weatherImage: String = "cloud.fill"
    
    var body: some View {
        VStack{
            Text(city)
                .padding()
            Text("\(temp, specifier: "%.1f")ºC")
                .padding()
            Image(systemName: weatherImage)
                .padding()
            HStack {
                Text("\(lowTemp, specifier: "%.1f")ºC")
                Text("\(highTemp, specifier: "%.1f")ºC")
            }
            .padding()
            HStack {
                Button ("Toronto") {
                    hasChanged.toggle()
                    hasChanged2.toggle()
                }
                .onChange(of: hasChanged) { newValue in
                    city = "Toronto"
                    weather.getWeather(city: city)
                    
                    temp = weather.temp
                    lowTemp = weather.tempMin
                    highTemp = weather.tempMax
                }
                Button ("London") {
                    city = "London"
                    weather.getWeather(city: city)
                    
                    temp = weather.temp
                    lowTemp = weather.tempMin
                    highTemp = weather.tempMax
                    
                    weather.printWeatherData()
                }
                Button ("Tampa") {
                    city = "Tampa"
                    weather.getWeather(city: city)
                    
                    temp = weather.temp
                    lowTemp = weather.tempMin
                    highTemp = weather.tempMax
                    
                    weather.printWeatherData()
                }
            }
            .foregroundColor(Color(.systemGray))
            .imageScale(.large)
        }
        .onAppear {
            weather.getWeather(city: "Toronto") {
                toRun()
            }
        }
    }
    
    func toRun() {
        weather.printWeatherData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
