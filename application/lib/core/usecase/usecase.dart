abstract class UseCase<T, Dynamic> {
  Future<T> call(Dynamic params);
}
