import 'package:flutter_test/flutter_test.dart';
import 'package:framework/app/app.dart';

void main() {
  late DefaultInitializer sut;

  setUp(() {
    sut = DefaultInitializer();
  });

  group('[DefaultInitializer: init() Method Test]', () {
    test(
      "1. Test whether it is invoked the DefaultApplicationDependecyRegister initAllRegisters method or not?",
      () async {
        sut.init();
      },
    );
  });
}
