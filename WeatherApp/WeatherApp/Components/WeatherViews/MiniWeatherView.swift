//
//  MiniWeatherView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-14.
//

import SwiftUI

struct MiniWeatherView: View {
    @Binding var city: String
    @Binding var curTemp: Double
    @Binding var feelsLike: Double
    @Binding var lowTemp: Double
    @Binding var highTemp: Double

    var body: some View {
        VStack {
            HStack {
                Text("\(city)")
                    .font(.title)
                    .frame(alignment: .leading)
                Spacer()
            }
            Spacer(minLength: 0)
            HStack {
                TempText(temp: $curTemp)
                    .font(.title)
                    .frame(alignment: .leading)
                Spacer()
                feelsLikeBlock
                    .frame(alignment: .center)
                Spacer()
                HighAndLowTemps(
                    lowTemp: $lowTemp,
                    highTemp: $highTemp
                )
                    .frame(alignment: .trailing)
                    .padding(.vertical)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
    
    var feelsLikeBlock: some View {
        FeelsLike(
            curTemp: $curTemp,
            feelsLikeTemp: $feelsLike
        )
    }
}

struct MiniWeatherView_Previews: PreviewProvider {
    @State static var city = "New York"
    @State static var curTemp = 7.0
    @State static var feelsLike = 3.0
    @State static var lowTemp = 2.0
    @State static var highTemp = 10.0
    
    static var previews: some View {
        MiniWeatherView(
            city: $city,
            curTemp: $curTemp,
            feelsLike: $feelsLike,
            lowTemp: $lowTemp,
            highTemp: $highTemp
        )
    }
}
