import 'package:bloc/bloc.dart';
import 'package:core_project/core/bloc/base_event.dart';
import 'package:core_project/core/bloc/base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(const DataLoadedState());
    });
    on<ErrorEvent>((event, emit) {
      emit(ErrorState(message: event.error));
    });
    on<LoadMoreEvent>((event, emit) {
      var currentState = state;
      if (!_hasReachedMax(currentState)) {
        emit(LoadMoreSuccessState());
      }
    });
  }
}

bool _hasReachedMax(BaseState state) =>
    state is LoadMoreSuccessState && state.hasReachedMax!;
