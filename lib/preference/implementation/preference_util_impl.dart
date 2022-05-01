import 'package:shared_preferences/shared_preferences.dart';
import '../../framework.dart';

class PreferenceUtil implements IPreferenceUtil {
  static final logger = DependencyInjector.getInstance()<ICustomLogger>()
      .getLogger(PreferenceUtil);

  static late SharedPreferences _prefsInstance;

  PreferenceUtil() {
    PreferenceUtil.init();
  }

  static Future<SharedPreferences> init() async {
    logger.i('Entered in to PreferenceUtils.init() method');
    logger.i('Application Shared Preference initiation was started');
    _prefsInstance = await SharedPreferences.getInstance();
    logger.i('Application Shared Preference initiation was completed');
    logger.i('Exit from PreferenceUtils.init() method');
    return _prefsInstance;
  }

  @override
  bool setPreference(String key, String value) {
    logger.i('Entered in to PreferenceUtils.setString() method with prefKey: ' +
        key +
        ' and prefValue: ' +
        value);
    bool prefStatus = false;
    _prefsInstance.setString(key, value).then((status) => prefStatus = status);
    logger.i('Exit from PreferenceUtils.setString() method with status ' +
        prefStatus.toString());
    return prefStatus;
  }

  @override
  String getPreference(String key, String defValue) {
    logger.i('Entered in to PreferenceUtils.getString() method with prefKey: ' +
        key +
        ' and defaultValue: ' +
        defValue);
    var prefValue = _prefsInstance.getString(key) ?? defValue;
    logger.i(
        'Exit from PreferenceUtils.getString() method with storedValue as ' +
            prefValue);
    return prefValue;
  }
}
