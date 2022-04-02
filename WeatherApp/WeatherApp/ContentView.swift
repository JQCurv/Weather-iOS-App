//
//  ContentView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-02-15.
//  Inspired by article: https://www.globalnerdy.com/2016/04/02/how-to-build-an-ios-weather-app-in-swift-part-1-a-very-bare-bones-weather-app/

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListView(
            viewModel: ListViewModel(
                cities: ["Toronto", "Tampa", "Cancun", "London", "Austin"]
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
