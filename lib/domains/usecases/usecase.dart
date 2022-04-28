/// Base Use case, all use cases should extend this class
/// TODO: Genericize this class
abstract class Usecase {
  Future<T> execute<T>();
}
