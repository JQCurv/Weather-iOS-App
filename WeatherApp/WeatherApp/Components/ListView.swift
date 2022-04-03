//
//  ListView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-04-02.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel: ListViewModel
    
    @ViewBuilder
    var body: some View {
        //Need navigation view for nav link to work
        NavigationView {
            cityList
                .navigationTitle("Weather")
        }
    }
    
    var cityList: some View {
        List {
            ForEach (0..<viewModel.cities.count, id: \.self) { index in
                NavigationLink {
                    FullWeatherView(
                        city: $viewModel.cities[index],
                        curTemp: $viewModel.temps[index],
                        feelsLike: $viewModel.feelsLikeTemps[index],
                        lowTemp: $viewModel.lowTemps[index],
                        highTemp: $viewModel.highTemps[index],
                        image: $viewModel.images[index],
                        imageColor: $viewModel.imageColors[index]
                    )
                } label: {
                    MiniWeatherView(
                        city: $viewModel.cities[index],
                        curTemp: $viewModel.temps[index],
                        feelsLike: $viewModel.feelsLikeTemps[index],
                        lowTemp: $viewModel.lowTemps[index],
                        highTemp: $viewModel.highTemps[index]
                    )
                }
                .foregroundColor(.black)
                .onAppear {
                    viewModel.useData(i: index)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel.mock)
    }
}
