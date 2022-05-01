<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Framework
This is the package which was developed to minimize some kind of quite repeated tasks like Logger, Dependecy Injection (IOC), Shared Preference storage,..etc in flutter application development by doing a simple configuration

## Features

1. Helps to configure your runtime instances very easily with this structured configuration for DI (IOC). Refer the Usage section for an detailed steps
2. Helps to add pre-defined logger functionality. Refer the Usage section for an detailed steps
3. Helps to add pre-defined shared preference. So, you can easily store and retrieve any unsecured key value pairs in it with minimal configuration. Refer the Usage section for an detailed steps

## Getting started

- At first you need to add this package as your dependency in your project pubspec.yaml file as like below
```dart
dependencies:
  flutter:
    sdk: flutter  
  framework:
    git:
      url: https://github.com/Subu-Solo-Developer/framework.git
```

## Usage
#### 1. Dependency Injection (IOC) Usage
* At first create all your dependency related classes
##### Example:
* In this example we have created a ```PhotoService``` class as an dependecy class
```dart
abstract class IPhotoService {
  String fetchPhotoName();
}

class PhotoService extends IPhotoService {
  @override
  String fetchPhotoName() {
    return "photo.png";
  }
}

```
- Then you need to create your custom register simply by extending our product class ```DependencyRegister``` and need to overrite the below methods based on your need.
``` dart
import 'package:framework/app/app.dart';

class ServiceDependecyRegister extends DependencyRegister {
  @override
  registerAllSingletonInstances() {
    getIt.registerSingleton<IPhotoService>(PhotoService());
  }

  @override
  registerAllSingletonInstancesWithDependency() {}
}

```
- Once you have created your custom register classes, then you need to enroll those registers in to our product initializer by simply extending our product class ```Initializer``` 
``` dart
import 'package:framework/app/app.dart';

import '../dInjection/d_Injection.dart';

class CustomApplictionInitializer extends Initializer {
  @override
  enrollAllCustomRegisters() {
    enrollRegister(ServiceDependecyRegister());
  }
}

```
- Once you have done with both CustomRegister creation with required Runtime instance mapping & Custom Register enrollement in Initializer. Then you need to call the init method as like below.
``` dart
import 'package:flutter/material.dart';
import 'package:test_project/app/initializer/initializer.dart';
import 'package:test_project/page.dart';

void main() {
  init();
  runApp(MyApp());
}

init() {
  CustomApplictionInitializer().init();
}
```
- Now, most of the configuration was completed. Inorder to access our registered runtime instances you need to use the below line of code in all required places.
``` dart
   IPhotoService photoService =
         DependencyInjector.getInstance()<IPhotoService>();
```
##### Some Pre-COnfigured Product Dependencies are 
``` dart
final logger =
      DependencyInjector.getInstance()<ILogger>().getLogger(HomePage);

static final preferences = DependencyInjector.getInstance()<IPreferenceUtil>();
```
##### Example
``` dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IPhotoService photoService =
      DependencyInjector.getInstance()<IPhotoService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(photoService.fetchPhotoName()), // Will give the photo.png
      ),
    );
  }
}
```

## Important Point to Remember
- If you want to register any duplicate instances which was already registered. Then you must unregister those previous one before register your new one in to our registry or else it might complaint
##### Example Scenario:
- Let's take an scenori like, you don't like the default product logger implementation, so you want to implement your own custom logger implementation. In this case you must unregister that old product logger instance from registry before register your new custom logger instance.

##### Example:

```dart
import 'package:framework/framework.dart';
import 'package:logger/logger.dart';

class ServiceDependecyRegister extends DependencyRegister {
  
   @override
  registerAllSingletonInstances() {
    getIt.unregister(
        instanceName: "ILogger",
        instance: DependencyInjector.getInstance()<ILogger>());
    getIt.registerSingleton<ILogger>(OwnCustomLogger());
  }

  @override
  registerAllSingletonInstancesWithDependency() {}
 
}

class OwnCustomLogger extends ILogger {
  @override
  Logger getLogger(Type type) {
    return Logger();
  }
}
```

## Credits
  List of Dependent Packages for this framework package are
 ```dart
 dependencies:
  flutter:
    sdk: flutter  
  flutter_lints: ^1.0.0
  logger: ^1.1.0
  intl: ^0.17.0
  shared_preferences: ^2.0.13
  get_it: ^7.2.0
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
