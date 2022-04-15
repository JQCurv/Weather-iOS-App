//
//  WeatherImage.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-14.
//

import SwiftUI

struct WeatherImage: View {
    @Binding var image: String
    @Binding var color: Color
    var size: CGFloat

    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .foregroundColor(color)
        }
    }
}

struct WeatherImage_Previews: PreviewProvider {
    @State static var image = "cloud.fill"
    @State static var newColor = Color.gray
    static var size = 150.0
    static var previews: some View {
        WeatherImage(
            image: $image,
            color: $newColor,
            size: size
        )
    }
}
