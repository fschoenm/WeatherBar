//
//  WeatherAPI.swift
//  WeatherBar
//
//  Created by Frank Schönmann on 04.10.17.
//  Copyright © 2017 Frank Schönmann. All rights reserved.
//

import Foundation

struct Weather: CustomStringConvertible {
	var city: String
	var currentTemp: Float
	var conditions: String

	var description: String {
		return "\(city): \(currentTemp)°C and \(conditions)"
	}
}

class WeatherAPI {

	let API_KEY = "8b5f65c290e9dd46825a803d8647481d"
	let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

	func fetchWeather(_ query: String) {
		let session = URLSession.shared
		let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
		let url = URL(string: "\(BASE_URL)?APPID=\(API_KEY)&units=metric&q=\(escapedQuery!)")
		let task = session.dataTask(with: url!) { data, response, err in

			if let error = err {
				NSLog("Weather API error: \(error)")
			}

			if let httpResponse = response as? HTTPURLResponse {
				switch httpResponse.statusCode {
				case 200:
					if let weather = self.weatherFromJSONData(data!) {
						NSLog("\(weather)")
					}
				case 401:
					NSLog("Weather API error: Unauthorized")
				default:
					NSLog("Weather API error: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
				}
			}

		}
		task.resume()
	}

	func weatherFromJSONData(_ data: Data) -> Weather? {
		typealias JSONDict = [String:AnyObject]
		let json : JSONDict

		do {
			json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDict
		} catch {
			NSLog("JSON parsing failed: \(error)")
			return nil
		}

		var mainDict = json["main"] as! JSONDict
		var weatherList = json["weather"] as! [JSONDict]
		var weatherDict = weatherList[0]

		let weather = Weather(
			city: json["name"] as! String,
			currentTemp: mainDict["temp"] as! Float,
			conditions: weatherDict["main"] as! String
		)

		return weather
	}

}
