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

This package is very helpful for all flutter projects. Which you are trying to create it from scratch.

## Features

1. It helps you to add beutiful logging
2. It have the basic config setup required for shared preference. So, you can easily store and retrieve any unsecured key value pairs.
3. Implemented the GetIt IOC feature, simply by doing small changes. You can easily achieve dependency Injection features.

## Getting started

1. Need to add this package as your dependency in your project pubspec.yaml file as like below

2. This packages is dependent upon below list of other packages. So, you don't required to readd those dependencies again in to your project.
   flutter_lints: ^1.0.0
   logger: ^1.1.0
   intl: ^0.17.0
   shared_preferences: ^2.0.13
   get_it: ^7.2.0

## Usage

1. You need to create your own Initializer class by extending the package DefaultInitializer class
   as like below. And where you must need to call DefaultInitializer class init method. So, that the package will work.

```dart
class ApplicationInitializer extends DefaultInitializer {
  @override
  void init() {
    super.init();
  }
}
```

2. In your custom Initializer class you can add your own Dependency Injection related Registers as like below example. So, that you can get those object instance in any of your code and inject it in to some other classes.

3. How do accees any registered framework object instance or your custom object instance.
   Below are the way to access this farmework package related CustomLogger, PreferencesUtil
   This is the only two framework object instance configured. If you want to change this also you can unregister this instances and reregister your own custom object instances for logger and shared preferences as like below example 2.

Example: 1

```dart
final logger =
      DependencyInjector.getInstance()<ICustomLogger>().getLogger(HomePage);

static final preferences = DependencyInjector.getInstance()<IPreferenceUtil>();
```

Example: 2

```dart
import 'package:framework/framework.dart';
import 'package:logger/logger.dart';

class ApplicationInitializer extends DefaultInitializer {
  @override
  void init() {
    super.init();
    DependencyInjector.getInstance().unregister(
        instanceName: "ICustomLogger",
        instance: DependencyInjector.getInstance()<ICustomLogger>());
    DependencyInjector.getInstance()
        .registerSingleton<ICustomLogger>(OwnLogger());
  }
}

class OwnLogger extends ICustomLogger {
  @override
  Logger getLogger(Type type) {
    return Logger();
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
