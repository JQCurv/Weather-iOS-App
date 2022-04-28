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
    @Binding var sunrise: (hours: Int, minutes: Int)
    @Binding var sunset: (hours: Int, minutes: Int)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                .padding()
                //TODO: Add in sunrise/sunset
                sunriseAndSunset
                    .font(.title3)
                //TODO: Show timezone
                Spacer(minLength: 16)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var sunriseAndSunset: some View {
        HStack {
            HStack {
                Text(String(format: "%d:%02d", sunrise.hours, sunrise.minutes))
                Image(systemName: "sunrise.fill")
                    .foregroundColor(.yellow)
            }
            HStack {
                Image(systemName: "sunset.fill")
                    .foregroundColor(.yellow)
                Text(String(format: "%d:%02d", sunset.hours, sunset.minutes))
            }
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    @State static var city = "Toronto"
    @State static var curTemp = 0.0
    @State static var feelsLike = 0.0
    @State static var lowTemp = 0.0
    @State static var highTemp = 0.0
    @State static var image = "cloud.fill"
    @State static var imageColor = Color.gray
    @State static var sunrise = (hours:0, minutes:0)
    @State static var sunset = (hours:10, minutes:0)
    
    static var previews: some View {
        FullWeatherView(
            city: $city,
            curTemp: $curTemp,
            feelsLike: $feelsLike,
            lowTemp: $lowTemp,
            highTemp: $highTemp,
            image: $image,
            imageColor: $imageColor,
            sunrise: $sunrise,
            sunset: $sunset
        )
    }
}
