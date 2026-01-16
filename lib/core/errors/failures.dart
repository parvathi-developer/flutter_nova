abstract class Failures {
  final String message;
  const Failures(this.message);
}

abstract class ServerFailure extends Failures {
  const ServerFailure(super.message);
}

abstract class CacheFailure extends Failures {
  const CacheFailure(super.message);
}
