# Todo App

## Introduction

First, I would like to thank you for the opportunity to show my knowledge of flutter. I hope I could proven it. Unfortunately, I can not be delighted because I did not have too much time during these nine days next to my full-time job and the university. In the beginning, a made some awful decisions and because of those, I had to follow a bad way in the development. I have chosen to use an external library (boardview) for the main UI to spare some time, but because of this my hands were tied and I could not make proper state management and there are too many refresh and API calls. I tried to fork that library and make some changes, but the time limit was not enough. If I could restart I am pretty sure I would make my own BoardListView. The second mistake was with the ThemeBuilder for the dark/light mode. I wanted to try a new package for this and it was not working as I expected, the quality of the code has deteriorated a bit.
## Running the app
I used the latest Flutter version, so you should be able to build the application with this command:
```
flutter run
```
!!NOTE  
Unfortunately, I do not have my own OSX device, so I was not able to run/test the application with IOS, and I could not use the company's Mac for it. For this reason, all of the firebase integration will not work on IOS, please use any Android device for testing. Of course, I can prove that I can use OSX for IOS with my previous applications and maybe in the future with this app if it is necessary.  
(You can also download the latest release APK from the GitHub Action)
## Testing

I did not have too much experience with widget testing and Firebase function testing, for these reasons I postponed the testing to the and, and finally I could make some Unit Tests, but I know they are not enough and I have to evolve my knowledge.

## Firebase integration

For storing the data I used Firebase services. Thanks to that the online-offline data synchronization was handled. I know the proper way would be with user authentication, but right now every user can use the same collection of the main board.
I connected the Firebase analytics and crashlytics as well.
(Of course I can give you access)
![Analytics](/assets/analytics.PNG)
![Crashlytics](/assets/crashlytics.PNG)
![Firestore](/assets/db.PNG)

## Multi-language support
I used the flutter_localizations i18 package for the multilanguage support, and I added English and Spanish localization files, which are selected by the system language. (default English)

## CI/CD
For the Continuous Integration and Continuous Deployment, I created a GitHub action for the Android apk build. I know it is not fully cover the requirements, but I had time for doing this, I also have experience with CI/CD in Jenkins.




