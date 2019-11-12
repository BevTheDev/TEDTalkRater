
## Description

The app is a TEDTalk Rater, so you can search through a list of talks, and save a rating for any you've seen. The ratings are then displayed in a separate tab sorted by rating then by title. There is also an extra feature that's just for fun that will trigger on a shake gesture (Cmd + Ctrl + Z in the sim) from the main tabs screen. Make sure your sound is on first. 

## Setup

The project uses Cocoapods and ruby version 2.5.1. There is a ruby-version file in the project, but if you're not using rbenv, you may need to install that version first. Then run 'bundle install' and 'pod install' to set up the workspace. The project was designed to run only on iPhones, iOS 11.4+.

## Features

The interesting features of the project:
- TEDTalk objects are stored in CoreData once the user sets a rating
- TEDTalks are parsed from the CSV when the app launches - due to the size of the data, this parsing is done in batches for more responsive UI
- The data on the Ratings tab is fetched from CoreData and sorted by rating/title
- The search bar filters results by title and reloads the table as the user types
- Audio plays via AVAudioPlayer
- Unit/UI testing is done via XCTest. Code coverage is 93.3%.
