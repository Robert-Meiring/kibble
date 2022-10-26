import 'dart:io';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibble/shared/logic/share/blocs/dog_bloc/share_events.dart';
import 'package:kibble/shared/logic/share/blocs/dog_bloc/share_states.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class ShareBloc extends Bloc<ShareEvents, ShareStates> {
  ShareBloc() : super(InitialShareState()) {
    //download image
    on<DownloadEvent>(
      (event, emit) async {
        try {
          var response = await http.get(
            Uri.parse(event.shareEntity.url),
          );
          //generate random string for file naming
          const _chars =
              'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
          Random _rnd = Random();
          final _imgID = String.fromCharCodes(Iterable.generate(
              10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
          File file = File('/storage/emulated/0/Download/$_imgID.jpg');
          //write file to storage, emit success state
          file.writeAsBytesSync(response.bodyBytes);
          emit(
            ShareSuccessState('Pupper downloaded!'),
          );
          //emit initial afterwards, as listeners need change in state for subsequent success states
          emit(InitialShareState());
        } catch (error) {
          ShareFailureState('CRITICAL ERROR, DEVICE WILL NOW COMBUST');
        }
      },
    );
    //share image
    on<ShareEvent>(
      (event, emit) async {
        //package used for simplistic implementation of link sharing
        try {
          Share.share(event.shareEntity.url,
              subject: 'Check out this cute pupper!');

          emit(
            ShareSuccessState('Pupper shared!'),
          );
          emit(InitialShareState());
        } catch (e) {
          emit(
            ShareFailureState('CRITICAL ERROR, DEVICE WILL NOW COMBUST'),
          );
        }
      },
    );
  }
}
