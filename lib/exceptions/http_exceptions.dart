class HttpException implements Exception {
  const HttpException({
    required this.message,
    required this.prefix,
    required this.url,
  });

  final String message;
  final String prefix;
  final String url;
}

class BadRequestException extends HttpException {
  BadRequestException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'Mauvaise demande',
          url: url ?? '',
        );
}

class FetchDataException extends HttpException {
  FetchDataException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'Impossible de traiter',
          url: url ?? '',
        );
}

class ApiNotRespondingException extends HttpException {
  ApiNotRespondingException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: "L'API n'a pas répondu à temps",
          url: url ?? '',
        );
}

class UnauthorizedException extends HttpException {
  UnauthorizedException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'Demande non autorisée',
          url: url ?? '',
        );
}
