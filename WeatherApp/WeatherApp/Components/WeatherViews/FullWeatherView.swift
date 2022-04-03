//
//  FullWeatherView.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-08.
//

import SwiftUI

struct FullWeatherView: View {
    @Binding var city: String
    @Binding var curTemp: Double
    @Binding var feelsLike: Double
    @Binding var lowTemp: Double
    @Binding var highTemp: Double
    @Binding var image: String
    @Binding var imageColor: Color
    
    var body: some View {
        VStack {
            Text("\(city)")
                .font(.title)
                .padding()
            TempText(temp: $curTemp)
                .font(.system(size: 60))
            WeatherImage(
                image: $image,
                color: $imageColor,
                size: 150
            )
            FeelsLike(
                curTemp: $curTemp,
                feelsLikeTemp: $feelsLike,
                font: .title2
            )
            .padding()
            HighAndLowTemps(
                lowTemp: $lowTemp,
                highTemp: $highTemp,
                font: Font.title3
            )
            //TODO: Add in sunrise/sunset
            //TODO: Show timezone
            Spacer(minLength: 16)
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    @State static var city = "Toronto"
    @State static var curTemp = 0.0
    @State static var feelsLike = 0.0
    @State static var lowTemp = 0.0
    @State static var highTemp = 0.0
    @State static var image = "Clouds"
    @State static var imageColor = Color.gray

    static var previews: some View {
        FullWeatherView(
            city: $city,
            curTemp: $curTemp,
            feelsLike: $feelsLike,
            lowTemp: $lowTemp,
            highTemp: $highTemp,
            image: $image,
            imageColor: $imageColor
        )
    }
}
