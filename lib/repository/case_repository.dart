import 'package:dio/dio.dart';


import 'package:doctor_consultation/network/utils/dio_client.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:logger/logger.dart';

class CaseRepository {
  late DioClient dioClient;

  final logger = Logger(level: Logger.level);

  CaseRepository() {
    var dio = Dio();
    dioClient = DioClient(dio);
  }
}
