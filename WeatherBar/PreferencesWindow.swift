//
//  PreferencesWindow.swift
//  WeatherBar
//
//  Created by Frank Schönmann on 06.10.17.
//  Copyright © 2017 Frank Schönmann. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {

	@IBOutlet var cityTextField: NSTextField!

	override var windowNibName: NSNib.Name? {
		return NSNib.Name(rawValue: "PreferencesWindow")
	}

	override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
		self.window?.center()
		self.window?.makeKeyAndOrderFront(nil)
		NSApp.activate(ignoringOtherApps: true)
    }

}
