import 'package:get_it/get_it.dart';
import '../../../framework.dart';

class DefaultApplicationDependecyRegister extends DependencyRegister {
  @override
  registerAllSingletonInstances() {
    getIt.registerSingleton<ICustomLogger>(CustomLogger());
    getIt.registerSingleton<IPreferenceUtil>(PreferenceUtil());
  }

  @override
  registerAllSingletonInstancesWithDependency() {}
}

abstract class DependencyRegister extends IDependencyRegister {
  @override
  initRegister() {
    registerAllSingletonInstances();
    registerAllSingletonInstancesWithDependency();
  }
}

class DependencyInjector {
  static final GetIt _getIt = GetIt.instance;
  static GetIt getInstance() {
    return _getIt;
  }
}
