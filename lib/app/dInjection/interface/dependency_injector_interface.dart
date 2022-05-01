import 'package:get_it/get_it.dart';

import '../d_injection.dart';

abstract class IDependencyRegister {
  final GetIt getIt = DependencyInjector.getInstance();
  initRegister();
  registerAllSingletonInstances();
  registerAllSingletonInstancesWithDependency();
}
