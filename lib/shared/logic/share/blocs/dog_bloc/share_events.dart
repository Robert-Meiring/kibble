import 'package:equatable/equatable.dart';
import 'package:kibble/shared/logic/share/entities/share_entity.dart';

//abstract class, events to be used for Share BLoC

abstract class ShareEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class DownloadEvent extends ShareEvents {
  final ShareEntity shareEntity;

  DownloadEvent(this.shareEntity);
}

class ShareEvent extends ShareEvents {
  final ShareEntity shareEntity;

  ShareEvent(this.shareEntity);
}
