// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
  @override
  List<dynamic> get props => [];
}

class InitialState extends BaseState {
  const InitialState();

  @override
  String toString() => "InitialState";
}

class LoadingState extends BaseState {
  @override
  String toString() => 'LoadingState';
}

class DataLoadedState extends BaseState {
  final dynamic data;

  const DataLoadedState({this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'DataLoadedState: $data';
}

class ErrorState extends BaseState {
  final dynamic message;

  const ErrorState({this.message});

  @override
  List<Object> get props => [message, DateTime.now()];

  @override
  String toString() => "Error: $message";
}

class LoadConfigState extends BaseState {
  final dynamic configs;
  final dynamic data;

  const LoadConfigState(this.configs, this.data);

  @override
  List<dynamic> get props => [configs, data];

  @override
  String toString() => 'LoadConfigState';
}

class LoadMoreSuccessState extends BaseState {
  List? data;
  bool? hasReachedMax;

  LoadMoreSuccessState({
    this.data,
    this.hasReachedMax,
  });

  LoadMoreSuccessState copyWith({
    List<BaseState>? data,
    bool? hasReachedMax,
  }) {
    return LoadMoreSuccessState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<dynamic> get props => [data, hasReachedMax];

  @override
  String toString() =>
      'LoadMoreSuccessState { posts: ${data!.length}, hasReachedMax: $hasReachedMax }';
}