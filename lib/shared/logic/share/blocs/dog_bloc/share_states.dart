import 'package:equatable/equatable.dart';

//abstract class, states to be used for Dog BLoC

abstract class ShareStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialShareState extends ShareStates {}

class ShareSuccessState extends ShareStates {
  final String message;

  ShareSuccessState(this.message);
}

class ShareFailureState extends ShareStates {
  final String message;

  ShareFailureState(this.message);
}
