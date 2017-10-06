# WeatherBar  [![Build Status](https://travis-ci.org/fschoenm/WeatherBar.svg?branch=master)](https://travis-ci.org/fschoenm/WeatherBar)
Weather status bar based on article at http://footle.org/WeatherBar/

## Next steps

* Add other weather info (high/low temp, humidity, sunrise/sunset, etc) to the Weather View
* Change the status menu icon + title to reflect the current conditions
* Add a timer to update the weather regularly (hint: ``RunLoop.main.add(refreshTimer!, forMode: RunLoopMode.commonModes)``).
* Make it so clicking on the Weather View opens a browser with detailed weather information (hint: ``NSWorkspace.shared().open(url: NSURL)``). Note that since we’re using a custom view, the menu item isn’t highlighted when you mouse over it, so you’ll probably want to do something to make it obvious that it is clickable.
* Add some error handling. Right now if we get an unexpected response from the API, for example, bad things will happen.
* Write some tests!
* Add an app icon. This isn’t hard, but it can be a pain creating the various sizes that Apple wants. Fortunately, there are tools to make this easier.
* Add a preference to launch the app on login. I’ve used the *LaunchAtLoginController* library in other apps. There’s also this blog post, if you want to try porting the code over to Swift.
* Create an About window.
* Add support for multiple cities. This will take some effort, especially if the number of cities is dynamic. I think you’ll have to put the Weather View in its own XIB, and load it manually (look at ``Bundle.main.loadNibNamed(name, owner: owner, options: options)``). The UI in Preferences will obviously need to be updated as well.
* Create a completely custom view when clicking on the app in the status bar. See the Weather Live app, for example. I haven’t tried this, but I suspect it is easier than you might think (depending on how fancy your view is, of course).