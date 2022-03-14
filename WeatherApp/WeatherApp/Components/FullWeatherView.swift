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
    
    var body: some View {
        VStack {
            Text("\(city)")
                .font(.title)
                .padding()
            TempText(temp: $curTemp)
                .font(.system(size: 60))
            weatherImage
            HStack {
                feelsLikeImage
                TempText(temp: $feelsLike)
                    .font(.title)
            }
            .padding()
            HStack(alignment: .center) {
                Image(systemName: "thermometer")
                    .foregroundColor(.blue)
                TempText(temp: $lowTemp)
                TempText(temp: $highTemp)
                Image(systemName: "thermometer")
                    .foregroundColor(.red)
            }
            .font(.title3)
        }
    }
    
    var weatherImage: some View {
        HStack {
            Image(systemName: "cloud.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.gray)
        }
    }
    
    var feelsLikeImage: some View {
        HStack {
            Image(systemName: "wind")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
                .foregroundColor(.blue)
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    @State static var city = "Toronto"
    @State static var curTemp = 0.0
    @State static var feelsLike = 0.0
    @State static var lowTemp = 0.0
    @State static var highTemp = 0.0

    static var previews: some View {
        FullWeatherView(
            city: $city,
            curTemp: $curTemp,
            feelsLike: $feelsLike,
            lowTemp: $lowTemp,
            highTemp: $highTemp
        )
    }
}
