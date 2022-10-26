import 'package:equatable/equatable.dart';

//abstract class, events to be used for Dog BLoC
abstract class DogEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class GetNextDogs extends DogEvents {}
