part of 'cubit.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitialState extends MainState {}

final class BusinessViewState extends MainState {}
final class SportsViewState extends MainState {}
final class ScienceViewState extends MainState {}

final class LightModeState extends MainState {}
final class DarkModeState extends MainState {}
