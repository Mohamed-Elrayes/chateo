import 'package:logger/logger.dart';

Logger _logger = Logger();
extension Log on Object {
  void logD() => _logger.d(toString());
  void logE() => _logger.e(toString());
  void logI() => _logger.i(toString());
  void logWtf() => _logger.wtf(toString());
  void logW() => _logger.w(toString());
  void logV() => _logger.v(toString());
}