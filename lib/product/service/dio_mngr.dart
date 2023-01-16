import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';

class DioManagerMixin {
  final service = Dio(BaseOptions(baseUrl: Constants.baseUrl));
}
