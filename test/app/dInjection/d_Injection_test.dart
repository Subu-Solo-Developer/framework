// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:framework/framework.dart';
import 'package:logger/src/logger.dart';

void main() {
  late DefaultApplicationDependecyRegister sut;
  late final Logger logger;
  late final IPreferenceUtil preference;
  setUp(() {
    sut = DefaultApplicationDependecyRegister();
  });

  group('[DefaultApplicationDependecyRegister: initAllRegisters Method Test]',
      () {
    test(
      "1. Test whether it is invoked the initAllRegisters method or not?",
      () {
        sut.initAllRegisters();
      },
    );
    test(
      "2. Test whether it is registered the CustomLoggger or not?",
      () {
        logger =
            DefaultApplicationDependecyRegister.getInstance()<ICustomLogger>()
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
        preference = DefaultApplicationDependecyRegister.getInstance()<
            IPreferenceUtil>();
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

        //! Combination One
        preference.setPreference(firstDataKey, actualFirstData);
        expectedFirstResult =
            preference.getPreference(firstDataKey, "Default Value");
        expect(actualFirstData, expectedFirstResult);

        //! Combination Two
        expectedSecondResult =
            preference.getPreference(secondDataKey, actualSecondData);
        expect(actualSecondData, expectedSecondResult);
      },
    );
  });
}
