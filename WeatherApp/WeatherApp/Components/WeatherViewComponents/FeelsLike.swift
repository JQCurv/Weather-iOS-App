//
//  FeelsLike.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-14.
//

import SwiftUI

struct FeelsLike: View {
    @Binding var image: String
    @Binding var feelsLikeTemp: Double
    @Binding var color: Color
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(height: 36)
                .foregroundColor(color)
            TempText(temp: $feelsLikeTemp)
                .font(.title)
        }
    }
}

struct FeelsLike_Previews: PreviewProvider {
    @State static var image = "wind"
    @State static var feelsLikeTemp = 0.0
    @State static var color = Color.blue
    static var previews: some View {
        FeelsLike(
            image: $image,
            feelsLikeTemp: $feelsLikeTemp,
            color: $color
        )
    }
}
