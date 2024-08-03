# Lilist APP

Lilist Application built using flutter. This project support for Android and iOS app. The project is build using clean architecture approach.

## Getting Started
This section will help you understand the structure of the project as well as guide you 
to development process. To run this project please contact your tech-lead to get more detail about the environment.

### Project Structure
The structure of project separated by functionality of file, with structure as below
```
├── README.md
├── .vscode
├── android
├── ios
├── build
├── assets
│   ├── fonts
│   │   └── WorkSans
│   ├── icons
│   │   ├── 2.0x
│   │   ├── 3.0x
│   │   ├── 4.0x
│   │   └── icon.png
│   └── images
│       ├── 2.0x
│       ├── 3.0x
│       ├── 4.0x
│       └── image.png
├── lib
│   ├── src
│   │   ├── app
│   │   ├── features
|   |   |   ├── feature1
│   │   │   ├── data
│   │   │   ├── domain
│   │   │   ├── presentation
│   │   ├── localization
│   │   ├── app.dart
│   │   ├── main.dart
├── pubspec.lock
├── pubspec.yaml
└── test
```

The project structure in more details could be explained this way

- README.md this file, which contains all resources you need to do to start development
- Standard android, ios, web and build folder structures
- assets contains any assets file such as images, icons, fonts, json, etc.
- lib this is the main code of the application
   1. cores folder is the basis of the application
       - consts contains any key for replace static string key/path code in this project
       - i18n contains language string based on locale and translation helper
       - styles contains default style declaration
       - utils contains any utilities for build this project
   2. feature contains all the package structure for the specific application, the approach used in clean architecture
       - data folder contains implementation of domain repository interface, which bridge between datasource and        entity. Converters for convert entity to model vice versa. Datasource used for retrieve data from network / local. Model is a extension from entity that support json converter can include platform dependency. 
       - domain folder contains the business object/function and use cases which is the main logic of the features. Entity is a business rule of this application not dependend to platform.
       - presentation folder contains the presentation of the features in ui level, and controller to handle how the ui should react to changes. Binding to declare prerequisite for this layout.
- main.dart entry point of the application
- pubspec.yaml and lock contains app setup, dependency setup
- test this is the main code of application test
    1. Add unit test in data, domain, and controller from this project
    2. Add widget test in widgets and pages from this project
 
### How to use
To add this module to the application, please follow these steps:
1. Clone with Http or SSH.
2. Open `pubspec.yaml` file from your application.
3. Run command `flutter pub get`.
4. Setup your run & debug configuration on android studio or create launch.json on visual studio. (Sample launch.json on below).
5. run and debug the application.
6. now you are ready to develop! enjoy!

launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "android_dev",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart"
        }
    ],
}

