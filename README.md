# MCQ App (Skillset Evaluation Project)

This project is for the Flutter skill set evaluation.

# Requirements

1. Home screen with the list of 5 tabs
2. Main Tab is **For You** section
3. For you screen is the main screen.
4. Displaying the Multiple Choice Questions(MCQs)
5. Revealing the correct answer when the user taps the MCQ
6. Showing the content's author name, playlist, avatar etc.,

# Implementation

- ### Main screen with multiple tabs
- ### Home screen with infinite scrolling which has ForYou screen
- ### For You screen for the MCQ questions and options
- ### For You bloc which interacts with the usecases
- ### For you repository which has the implementation to interact with data source
- ### APIService is used for networking
- ### Used clean architecture
- ### No business logic is handled on the UI Part.
- ### Followed SOLID and DRY principles.
- ### Used GetIt with a custom wrapper for dependency injection.

# Frameworks used

- [BLoC](https://pub.dev/packages/flutter_bloc) => BLoC is the state management framework used to
  render the widget upon the state changes.
- [dio](https://pub.dev/packages/dio) => Dio is a powerful http networking packing
- [GetIt](https://pub.dev/packages/get_it) => A simple service locator package used for DI
- [FlutterSVG](https://pub.dev/packages/flutter_svg) => Package to load SVG images
- [JSON Serializable](https://pub.dev/packages/json_serializable) => Framework used to generate data
  models to and from JSON.

# Demo Video

## Demo Video can be found in the repository [here](https://github.com/ourdex864/bharath_work_assessment/bharath_assessment_recording.mov)