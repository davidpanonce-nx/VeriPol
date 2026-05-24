import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
sealed class PageState with _$PageState {
  const factory PageState({
    required bool isGoogleAccount,
    required int bottomNavIndex,
  }) = _PageState;
}
