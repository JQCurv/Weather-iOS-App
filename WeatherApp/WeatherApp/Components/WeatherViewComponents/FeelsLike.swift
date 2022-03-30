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
    var font: Font = Font.body
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(color)
            TempText(temp: $feelsLikeTemp)
        }
        .font(font)
    }
}

struct FeelsLike_Previews: PreviewProvider {
    @State static var image = "wind"
    @State static var feelsLikeTemp = 5.0
    @State static var color = Color.blue
    static var font = Font.title
    
    static var previews: some View {
        FeelsLike(
            image: $image,
            feelsLikeTemp: $feelsLikeTemp,
            color: $color,
            font: font
        )
    }
}
