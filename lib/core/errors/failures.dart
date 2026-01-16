abstract class Failures {
  final String message;
  const Failures(this.message);
}

abstract class ServerFailure extends Failures {
  const ServerFailure(String message) : super(message);
}

abstract class CacheFailure extends Failures {
  const CacheFailure(String message) : super(message);
}
