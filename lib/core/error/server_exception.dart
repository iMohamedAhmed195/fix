

import 'package:fix/core/error/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({
    required this.errorMessageModel,
  });
}

