# crypto_pocket

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.
## It has used cloud firestore service
## used flutterfire dependencies
## faced problem in accessing WidgetsFlutterBinding.ensureInitialized();
 ## await Firebase.initializeApp(); in project. It was not running after this line of code->
## things which I done to solve problem->
## first I have to build gradle successfully for that I had to solve error related to google service ->
## 1) update dependencies
## 2) update flutter by flutter upgrade
## 3) change minsdk from 16 to 20 from local.properties file
## 4) Name of GoogleServices.json file should not be GoogleServices(1).json same for google_servicesInfo.json


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
