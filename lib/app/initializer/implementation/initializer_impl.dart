import '../../../framework.dart';

class DefaultInitializer implements IInitializer {
  @override
  void init() {
    DefaultApplicationDependecyRegister().initAllRegisters();
  }
}
