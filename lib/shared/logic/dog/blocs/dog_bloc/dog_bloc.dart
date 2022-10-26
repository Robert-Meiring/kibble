import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibble/shared/logic/dog/blocs/dog_bloc/dog_events.dart';
import 'package:kibble/shared/logic/dog/blocs/dog_bloc/dog_states.dart';
import 'package:http/http.dart' as http;

class DogBloc extends Bloc<DogEvents, DogStates> {
  DogBloc() : super(InitialDogState()) {
    on<GetNextDogs>((event, emit) async {
      //emit busy state to notify ui of loading
      emit(GetDogsBusyState());

      const _urlDogs = 'https://dog.ceo/api/breeds/image/random/50';
      //try-catch to call API, check status, assign data, emit state
      try {
        var _responseDogs = await http.get(
          Uri.parse(_urlDogs),
        );

        final Map? _dogMap = json.decode(_responseDogs.body);
        late List? _dogList;

        if (_dogMap!['status'] == 'success') {
          _dogList = _dogMap['message'];
        } else {
          _dogList = null;
        }

        _dogList != null
            ? emit(
                GetDogsSuccessState(urls: _dogList),
              )
            : emit(
                GetDogsFailureState('SELF DESTRUCTION SEQUENCE ACTIVATED'),
              );
      } catch (e) {
        emit(
          GetDogsFailureState('SELF DESTRUCTION SEQUENCE ACTIVATED'),
        );
      }
    });
  }
}
