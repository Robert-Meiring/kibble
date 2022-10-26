import 'package:equatable/equatable.dart';

//abstract class, states to be used for Dog BLoC
abstract class DogStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialDogState extends DogStates {}

class GetDogsBusyState extends DogStates {}

class GetDogsSuccessState extends DogStates {
  GetDogsSuccessState({required this.urls});
  final List urls;
}

class GetDogsFailureState extends DogStates {
  final String message;

  GetDogsFailureState(this.message);
}
