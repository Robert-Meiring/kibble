import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibble/screens/individual_pup_view/widgets/pup_image.dart';
import 'package:kibble/shared/factory/register_factory.dart';
import 'package:kibble/shared/logic/share/blocs/dog_bloc/share_bloc.dart';
import 'package:kibble/shared/logic/share/blocs/dog_bloc/share_events.dart';
import 'package:kibble/shared/logic/share/blocs/dog_bloc/share_states.dart';
import 'package:kibble/shared/logic/share/entities/share_entity.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/widgets/buttons/kibble_buttons.dart';
import 'package:kibble/shared/widgets/dialogs/kibble_dialogs.dart';

class IndividualPupView extends StatelessWidget {
  const IndividualPupView({Key? key, required this.url, required this.index})
      : super(key: key);
  //get index and url as parameters, index to be used for Hero animation, url for download and share
  final String url;
  final int index;

  void Function()? downloadPressed() {
    //add event to bloc
    return () => sl.get<ShareBloc>().add(DownloadEvent(ShareEntity(url)));
  }

  void Function()? sharePressed() {
    //add event to bloc
    return () => sl.get<ShareBloc>().add(ShareEvent(ShareEntity(url)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KibbleColors.background,
      body: SafeArea(
        top: true,
        child: BlocListener(
          bloc: sl.get<ShareBloc>(),
          listener: (context, state) {
            if (state is ShareSuccessState) {
              KibbleDialogs().showSuccessDialog(state.message, context);
            } else if (state is ShareFailureState) {
              KibbleDialogs().showErrorDialog(state.message, context);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Hero(
                      tag: index,
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: PupImage(url: url))),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  KibbleButton(
                      icon: Icons.download, onPressed: downloadPressed()),
                  KibbleButton(icon: Icons.share, onPressed: sharePressed())
                ],
              )),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: BackButton())
            ],
          ),
        ),
      ),
    );
  }
}
