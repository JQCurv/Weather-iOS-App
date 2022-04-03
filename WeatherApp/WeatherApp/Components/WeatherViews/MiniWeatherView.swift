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
    @Binding var image: String
    @Binding var imageColor: Color

    var body: some View {
        ZStack {
            WeatherImage(
                image: $image,
                color: $imageColor,
                size: .infinity
            )
            .opacity(0.25)
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
                    FeelsLike(
                        curTemp: $curTemp,
                        feelsLikeTemp: $feelsLike
                    )
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
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
}

struct MiniWeatherView_Previews: PreviewProvider {
    @State static var city = "New York"
    @State static var curTemp = 7.0
    @State static var feelsLike = 3.0
    @State static var lowTemp = 2.0
    @State static var highTemp = 10.0
    @State static var image = "sun.min"
    @State static var imageColor = Color.yellow
    
    static var previews: some View {
        MiniWeatherView(
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
