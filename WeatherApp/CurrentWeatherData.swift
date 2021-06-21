//
//  CurrentWeatherData.swift
//  hidekeyboard
//
//  Created by Apple on 23.12.2020.
//

import Foundation
struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double

}

struct Weather: Decodable {
    let id: Int
}
