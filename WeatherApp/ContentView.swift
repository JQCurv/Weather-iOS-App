//
//  ContentView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-02-15.
//  Inspired by article: https://www.globalnerdy.com/2016/04/02/how-to-build-an-ios-weather-app-in-swift-part-1-a-very-bare-bones-weather-app/

import SwiftUI

struct ContentView: View {
    let normalCities = ["Newmarket", "Toronto", "Tampa", "Cancun", "London", "Austin","Tokyo", "Shanghai", "Paris", "Rome", "Athens", "Prague", "Munich", "Mumbai", "Dubai"]
    let nightCities = ["Tokyo", "Shanghai", "Mumbai", "Rome", "Athens", "Prague", "Toronto", "Tampa", "Munich"]
    var body: some View {
        ListView(
            viewModel: ListViewModel(
                cities: normalCities
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
