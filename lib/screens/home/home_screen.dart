import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibble/screens/home/widgets/dog_grid.dart';
import 'package:kibble/screens/home/widgets/splash.dart';
import 'package:kibble/shared/factory/register_factory.dart';
import 'package:kibble/shared/logic/dog/blocs/dog_bloc/dog_bloc.dart';
import 'package:kibble/shared/logic/dog/blocs/dog_bloc/dog_events.dart';
import 'package:kibble/shared/logic/dog/blocs/dog_bloc/dog_states.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/widgets/animations/kibble_animator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = ScrollController();
  //list to be appended with image URL's of dogs with each subsequent reponse from the endpoint
  List infiniteDogsUrls = [];
  @override
  void initState() {
    super.initState();
    //add event to BLoC here to load images on startup
    sl.get<DogBloc>().add(GetNextDogs());
    //add listener to scrollcontroller to detect when position hits bottom
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0.0) {
          //load next set of images once controller hits bottom
          sl.get<DogBloc>().add(GetNextDogs());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KibbleColors.background,
      body: SafeArea(
        top: true,
        child: BlocConsumer(
          bloc: sl.get<DogBloc>(),
          listener: (context, state) {
            if (state is GetDogsSuccessState) {
              //append url list with new data from state
              infiniteDogsUrls.addAll(state.urls);
            }
          },
          builder: (context, state) {
            return KibbleAnimator(
              //display grid once first set of URLs are loaded
              child: infiniteDogsUrls.isNotEmpty
                  ? DogGrid(
                      controller: _controller,
                      infiniteDogsUrls: infiniteDogsUrls)
                  : const Splash(),
            );
          },
        ),
      ),
    );
  }
}
