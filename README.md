# deveoo_flutter_app

So i developed this flutter app which is basucally a single-file application (main.dart) already having experience in React Native Development which is kind of a hybrid developing platform like for this case you dont have to kill bugs in separate adnroid or ios platforms.
The app starts with a SplashScreen which was not required but for smooth responsiveness i added it for my own satisfaction which displays "Deveoo Flutter Intern Test App" for 3 seconds before navigating to the MainScreen, which serves as the navigation hub with a bonus Bottom Navigation Bar for switching between the HomeScreen and AboutScreen. The HomeScreen uses a ListView.builder to display for the posts: "Post 1" to "Post 10" in from of Card widgets, which we can further tap to open the display screens, which gets the comments from jsonplaceholder.typicode.com using FutureBuilder and before displaying it shows the loading spinner. The About Tab goes to the  personal details page, which i did for the bonus. But i also added the Drawer in the MainScreen which is also not required but it further  provides an additional navigation option.

I basically  used the http package for API calls, MaterialApp for routing, and setState for state management.Then i structured the code with   Scaffold widgets for layout consistency.

## Features
- **Home Screen**: Lists post cards from 1 to 10  using `ListView.builder`
- **Detail Screen**: Gets and then displays the comments from `https://jsonplaceholder.typicode.com/comments?postId={id}` using `FutureBuilder`, and while opening, shows the loading spinner.
- **About Screen**: Shows my personal details
 "Name: Mohammad Hamza Ijaz", 
 "Email: mijaz.bee22seecs@seecs.edu.pk", 
 "Flutter Intern Test".
- **Bottom Navigation**: Bottom nav-bar with "Home" and "About" tabs.


-------------- EXTRA TABS FOR SMOOTHNESS TO MAKE A PROPER APP BUT STILL NOT REQUIRED !!! -------------------

- **Splash Screen**: Added an extra splash welcome saying "Deveoo Flutter Intern Test App"
- **Drawer**: Added an extra drawer too just for the smoothness and shows the same 'home' and 'about' tabs.

## Installation Steps
 - You should have some softwares installed on your computer which in my case, i had already installed including Android Studio (from where you can get your own virtual device in its device manager) and Flutter SDK (which is a software development kit which provides essential libraries, tools and frameworks which one can use to develop, build and finally run ones flutter app by hitting some flutter run and build commands), and Git and Visual Studio Code.

 - **Flutter Commands**
    First of all remember you should chech whether all your flutter and git and every other kit are added in the path as in the system environmental variables!!!
    And while setting up your AVD in the android Studio go in the tool and then SDK manager tools and packages and make sure to download Android SDK command line updates and you can surely check if everything is completely ready by running:
      CMD: flutter doctor
   
    it will diagnose your machine and guide you to download every kit required to build the flutter app.

 1. Then go in the desired directory where you want to build your flutter app like in my case it was like:
      C:\Users\Hamza\OneDrive\Desktop\DeveooIntern\deveoo_flutter_app
    i made the directory and then named my flutter app as deveoo_flutter_app and make sure to put the http latest package in the pubspec.yaml file.
    then run:
    
      CMD: flutter pub get
    
      CMD: flutter run
    

    Now start coding the app...

 3. if you want to check on which device you want to run then run the following command:
    
      CMD: flutter devices
    
    what it will show is basically the chrome, edge and Windwos... ALL you have to choose one!

 5. So if you have started your AVD on the emulator then you can check if its running using:
    
      CMD: flutter emulators
    
    then it shows your emulator id then hit the following command to run it.
    
      CMD: flutter run -d your emulator id

 7. Now if you want to see your app on chrome then hit.
 8. 
      CMD: flutter run -d chrome

 9. Now the fun moment begins when you can finally build your apk which you can install in your own personal smartphones. For this run this:
     
      CMD: flutter build apk --split-per-abi --release
    
    it would build different apks and you can choose one desired for your own architechture like in my case "arm64"

   
## Contact me:
   - **Email**: mijaz.bee22seecs@seecs.edu.pk
   - **whatsapp**: +92 309-0097700
                   +92 310-2067777
   

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


