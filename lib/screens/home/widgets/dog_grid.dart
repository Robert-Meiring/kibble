import 'package:flutter/material.dart';
import 'package:kibble/shared/logic/dog/entities/individual_dog_entity.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/styling/kibble_radius.dart';
import 'package:kibble/shared/widgets/icons/kibble_icons.dart';
import 'package:kibble/shared/widgets/loaders/kibble_loaders.dart';
import 'package:kibble/shared/widgets/text/kibble_text_widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class DogGrid extends StatelessWidget {
  const DogGrid(
      {Key? key, required this.controller, required this.infiniteDogsUrls})
      : super(key: key);

  final ScrollController controller;
  final List infiniteDogsUrls;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      interactive: true,
      thickness: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: infiniteDogsUrls.length,
            itemBuilder: (context, index) {
              //display loading indicator on last element to indicate new images are currently loading
              return index != infiniteDogsUrls.length - 1
                  ? Hero(
                      tag: index,
                      child: Material(
                          color: KibbleColors.altBackground,
                          elevation: 8,
                          borderRadius: BorderRadius.circular(
                              KibbleRadius.defaultBorderRadius),
                          child: GestureDetector(
                            //push new page once an image is clicked, send entity through as args
                            onTap: () => Navigator.pushNamed(
                                context, '/individualpupview',
                                arguments: IndividualDogEntity(
                                    infiniteDogsUrls[index], index)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  KibbleRadius.defaultBorderRadius),
                              //stack is used to display loader until the network image is loaded
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  KibbleLoaders().defaultKibbleLoader(context),
                                  FadeInImage.memoryNetwork(
                                    image: infiniteDogsUrls[index],
                                    placeholder: kTransparentImage,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: KibbleIcons().kibbelIconDefault(
                                icon: Icons.pets_rounded, context: context)),
                        KibbleTextWidgets()
                            .kibbleDefaultText('Fetching more pups...', 0.8)
                      ],
                    );
            }),
      ),
    );
  }
}
