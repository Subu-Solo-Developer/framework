import '../../../framework.dart';

class DefaultApplicationInitializer extends Initializer {
  @override
  enrollAllCustomRegisters() {
    enrollRegister(DefaultApplicationDependecyRegister());
  }
}

abstract class Initializer implements IInitializer {
  Set<IDependencyRegister> registers = {};

  @override
  void init() {
    enrollAllCustomRegisters();
    _initializeAllEnrolledRegisters();
  }

  _initializeAllEnrolledRegisters() {
    for (IDependencyRegister dependencyRegister in registers) {
      dependencyRegister.initRegister();
    }
  }

  @override
  enrollRegister(IDependencyRegister dependencyRegister) {
    registers.add(dependencyRegister);
  }

  @override
  enrollSetOfRegisters(Set<IDependencyRegister> dependencyRegisters) {
    registers.addAll(dependencyRegisters);
  }
}
