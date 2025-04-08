import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_result.freezed.dart';


@freezed
sealed class PhotoResult<D, E> with _$PhotoResult<D, E>{
  const factory PhotoResult.success(D data) = Success;
  const factory PhotoResult.error(E error) = Error;
}