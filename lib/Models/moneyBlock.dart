import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocEvent{}
abstract class BlocState {}

class LoadingState extends BlocState{}

class FailedToLoadState extends BlocState {
  Exception error;
  FailedToLoadState({required this.error});
}

class Addnumber extends BlocEvent {
  int addMoney;
  Addnumber({required this.addMoney});
}
class Delnumber extends BlocEvent {
  int removeMony;
  Delnumber({required this.removeMony});
}

class SetNumber extends BlocEvent{
  int setMony;
  SetNumber({required this.setMony});
}

class LoadedState extends BlocState {}




class KeshavarziBloc extends Bloc<BlocEvent, int>{

  KeshavarziBloc() : super(0) {
    on(_onIncrement);
    on(_onDecrement);
    on(_onSet);
  }

  void _onIncrement(Addnumber event, Emitter emit) {
    emit(state + event.addMoney);
  }

  void _onDecrement(Delnumber event, Emitter emit) {
    emit(state - event.removeMony);
  }
  void _onSet(SetNumber event, Emitter emit) {
    emit(event.setMony);
  }
}