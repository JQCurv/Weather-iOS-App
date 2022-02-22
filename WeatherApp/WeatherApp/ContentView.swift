//
//  ContentView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-02-15.
//  Inspired by article: https://www.globalnerdy.com/2016/04/02/how-to-build-an-ios-weather-app-in-swift-part-1-a-very-bare-bones-weather-app/

import SwiftUI

struct ContentView: View {
    let weather = WeatherGetter()
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
        }.onAppear {
            weather.getWeather(city: "Tampa")
        }
        .onTapGesture {
            weather.getWeather(city: "Toronto")
            weather.printWeatherData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
