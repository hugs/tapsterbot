# Tapster

## Your new mobile app testing robot

#### ...that also knows how to [dance](http://youtu.be/lbjilf5cz88))

<span>
    ![Tapsterbot](http://hugs.github.io/img/jason-huggins-with-tapster.jpg)
</span>

##Dependencies
- Node/npm
- One Tapster robot

##Getting Started

1. Download and install the Arduino Client: [http://arduino.cc/en/Guide/HomePage](http://arduino.cc/en/Guide/HomePage)
2. Follow the setup procedure, and use the "blink" test script to verify your Arduino is working.
3. From the Arduino IDE upload the "Firmata" script: File -> Open -> Examples > Firmata > StandardFirmata
4. Install the dependencies: `npm install`
5. Start'er up: `node bot.js`
6. Start dancing: `dance()`


##Controlling the bot/device with your browser

1. Put your phone into the bot
2. (from inside the `src/` dir) start the repl: `node bot.js`
3. Open the calibration page on your phone: `http://<your machine's ip>:8011`
3. `calibrate()` the bot to the phone
4. Open the control page on your computer: `http://localhost:8011/control`
5. Make clicking actions with your computer, see them happen to your phone!

##Development
Run the following [grunt](http://gruntjs.com/) command to execute testing and code quality checks:

    grunt test

Put all [jasmine](http://pivotal.github.io/jasmine/) specs in the `spec` folder.
