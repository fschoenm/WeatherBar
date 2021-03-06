//
//  PreferencesWindow.swift
//  WeatherBar
//
//  Created by Frank Schönmann on 06.10.17.
//  Copyright © 2017 Frank Schönmann. All rights reserved.
//

import Cocoa

protocol PreferencesWindowDelegate {
	func preferencesDidUpdate()
}

class PreferencesWindow: NSWindowController, NSWindowDelegate {

	@IBOutlet var cityTextField: NSTextField!

	var delegate: PreferencesWindowDelegate?

	override var windowNibName: NSNib.Name? {
		return NSNib.Name(rawValue: "PreferencesWindow")
	}

	override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
		self.window?.center()
		self.window?.makeKeyAndOrderFront(nil)
		NSApp.activate(ignoringOtherApps: true)

		let defaults = UserDefaults.standard
		let city = defaults.string(forKey: "city") ?? DEFAULT_CITY
		cityTextField.stringValue = city
    }

	func windowWillClose(_ notification: Notification) {
		let defaults = UserDefaults.standard
		defaults.setValue(cityTextField.stringValue, forKey: "city")
		delegate?.preferencesDidUpdate()
	}

}
