abstract class SBDataState<T> {
  final T? data;
  final String? error;

  const SBDataState({this.data, this.error});
}

class SBDataSuccess<T> extends SBDataState<T> {
  const SBDataSuccess({required T data}) : super(data: data);
}

class SBDataError<T> extends SBDataState<T> {
  const SBDataError({required String error}) : super(error: error);
}
