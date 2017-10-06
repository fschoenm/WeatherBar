//
//  WeatherView.swift
//  WeatherBar
//
//  Created by Frank Schönmann on 06.10.17.
//  Copyright © 2017 Frank Schönmann. All rights reserved.
//

import Cocoa

class WeatherView: NSView {

	@IBOutlet var imageView: NSImageView!
	@IBOutlet var cityLabel: NSTextField!
	@IBOutlet var currentConditionsLabel: NSTextField!

	func update(_ weather: Weather) {
		// do UI updates in the main thread
		DispatchQueue.main.async {
			self.cityLabel.stringValue = weather.city
			self.currentConditionsLabel.stringValue = "\(weather.currentTemp)°C and \(weather.conditions)"
			self.imageView.image = NSImage(named: NSImage.Name(rawValue: weather.icon))
		}
	}

}
