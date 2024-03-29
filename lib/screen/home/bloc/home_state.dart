part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class DataState extends HomeState {
  final List<DailyTask>? dailyTasks;
  final DailyTask? dailyTask;
  final List<Expedition>? expeditions;
  final List<Platform>? platforms;
  const DataState(
      {this.dailyTasks, this.dailyTask, this.expeditions, this.platforms});
  @override
  List<Object?> get props => [dailyTasks, dailyTask, expeditions, platforms];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
