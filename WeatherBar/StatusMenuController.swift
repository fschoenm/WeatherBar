//
//  StatusMenuController.swift
//  WeatherBar
//
//  Created by Frank Schönmann on 04.10.17.
//  Copyright © 2017 Frank Schönmann. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

	@IBOutlet weak var statusMenu: NSMenu!
	@IBOutlet weak var weatherView: WeatherView!

	var weatherMenuItem: NSMenuItem!
	var preferencesWindow: PreferencesWindow!

	let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
	let weatherAPI = WeatherAPI()

	@IBAction func updateClicked(_ sender: NSMenuItem) {
		updateWeather()
	}

	@IBAction func preferencesClicked(_ sender: NSMenuItem) {
		preferencesWindow.showWindow(nil)
	}

	@IBAction func quitClicked(_ sender: NSMenuItem) {
		NSApplication.shared.terminate(self)
	}

	override func awakeFromNib() {
		// Insert code here to initialize your application
		preferencesWindow = PreferencesWindow()

		let icon = NSImage(named: NSImage.Name(rawValue: "statusIcon"))
		icon?.isTemplate = true
		statusItem.image = icon
		statusItem.menu = statusMenu

		weatherMenuItem = statusMenu.item(withTitle: "Weather")
		weatherMenuItem.view = weatherView

		updateWeather()
	}

	func updateWeather() {
		weatherAPI.fetchWeather("Nuremberg") { weather in
			self.weatherView.update(weather)
		}
	}

}
