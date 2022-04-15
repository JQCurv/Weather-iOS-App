//
//  FeelsLike.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-14.
//

import SwiftUI

struct FeelsLike: View {
    @Binding var curTemp: Double
    @Binding var feelsLikeTemp: Double
    var font: Font = Font.body
    
    @ViewBuilder
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(color)
            TempText(temp: $feelsLikeTemp)
        }
        .font(font)
    }
    
    var color: Color {
        if feelsLikeTemp > curTemp {
            return Color.red
        } else {
            return Color.blue
        }
    }
    
    var image: String {
        if feelsLikeTemp > curTemp {
            return "humidity.fill"
        } else {
            return "wind"
        }
    }
}

struct FeelsLike_Previews: PreviewProvider {
    @State static var curTemp = 5.0
    @State static var feelsLikeTemp = 5.0
    static var font = Font.title
    
    static var previews: some View {
        FeelsLike(
            curTemp: $curTemp,
            feelsLikeTemp: $feelsLikeTemp,
            font: font
        )
    }
}
