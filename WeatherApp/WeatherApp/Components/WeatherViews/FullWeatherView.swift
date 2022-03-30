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
            feelsLikeBlock
            .padding()
            HighAndLowTemps(
                lowTemp: $lowTemp,
                highTemp: $highTemp,
                font: Font.title3
            )
        }
    }
    
    var weatherImage: some View {
        @State var image = "cloud.fill"
        @State var newColor = Color.gray
        
        return WeatherImage(
            image: $image,
            color: $newColor
        )
    }
    
    var feelsLikeBlock: some View {
        @State var image = "wind"
        @State var feelsLikeTemp = 0.0
        @State var color = Color.blue
        
        return FeelsLike(
            image: $image,
            feelsLikeTemp: $feelsLikeTemp,
            color: $color,
            font: Font.title
        )
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
