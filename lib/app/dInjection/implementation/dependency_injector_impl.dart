import 'package:get_it/get_it.dart';
import '../../../framework.dart';

class DefaultApplicationDependecyRegister extends IDependencyInjectionRegister {
  static final GetIt _getIt = GetIt.instance;

  _initAllSingletonRegister() {
    _getIt.registerSingleton<ICustomLogger>(CustomLogger());
    _getIt.registerSingleton<IPreferenceUtil>(PreferenceUtil());
  }

  static GetIt getInstance() {
    return _getIt;
  }

  @override
  initAllRegisters() {
    _initAllSingletonRegister();
  }
}

class DependencyInjector {
  static GetIt getInstance() {
    return DefaultApplicationDependecyRegister.getInstance();
  }
}
