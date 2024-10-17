abstract class MessageException implements Exception {
  final String message;
  MessageException({required this.message});
}

class ErrorException extends MessageException {
  ErrorException({required super.message});
}

class WarningException extends MessageException {
  WarningException({required super.message});
}

class UnauthorizedException extends MessageException {
  UnauthorizedException({required super.message});
}
