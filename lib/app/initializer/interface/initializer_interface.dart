import '../../dInjection/d_injection.dart';

abstract class IInitializer {
  init();
  enrollAllCustomRegisters();
  enrollRegister(IDependencyRegister dependencyRegister);

  enrollSetOfRegisters(Set<IDependencyRegister> dependencyRegisters);
}
