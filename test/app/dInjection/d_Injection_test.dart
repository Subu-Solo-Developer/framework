// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:framework/framework.dart';
import 'package:logger/src/logger.dart';

void main() {
  late IDependencyRegister sut;
  late final Logger logger;
  late final IPreferenceUtil preference;
  setUp(() {
    sut = DefaultApplicationDependecyRegister();
  });

  group('[DefaultApplicationDependecyRegister: initRegister Method Test]', () {
    test(
      "1. Test whether it is invoked the initRegister method or not?",
      () {
        sut.initRegister();
      },
    );
    test(
      "2. Test whether it is registered the CustomLoggger or not?",
      () {
        logger = DependencyInjector.getInstance()<ICustomLogger>()
            .getLogger(DefaultApplicationDependecyRegister);
        logger.i("Custom Logger Initialized Successfully");
        logger.w("Custom Logger Initialized Successfully");
        logger.d("Custom Logger Initialized Successfully");
        logger.e("Custom Logger Initialized Successfully");
      },
    );

    test(
      "3. Test whether it is registered the PreferenceUtil or not?",
      () {
        preference = DependencyInjector.getInstance()<IPreferenceUtil>();
      },
    );
    test(
      "4. Test whether all different combination of preference setting & getting feature is working or not?",
      () async {
        String firstDataKey = "Test Key 1";
        String actualFirstData = "Test Data 1";
        String expectedFirstResult;
        String secondDataKey = "fail-key";
        String actualSecondData = "Default Value";
        String expectedSecondResult;

        //! Case:1
        preference.setPreference(firstDataKey, actualFirstData);
        expectedFirstResult =
            preference.getPreference(firstDataKey, "Default Value");
        expect(actualFirstData, expectedFirstResult);

        //! Case:2
        expectedSecondResult =
            preference.getPreference(secondDataKey, actualSecondData);
        expect(actualSecondData, expectedSecondResult);
      },
    );
  });
}
