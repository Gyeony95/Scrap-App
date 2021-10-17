import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final String? content;
  final String? imagePath;

  const MainLoaded({
    this.content,
    this.imagePath,
  });

  MainLoaded copyWith({String? content, String? imagePath}) =>
      MainLoaded(
        content: content ?? this.content,
        imagePath: imagePath ?? this.imagePath,
      );

  // WriteLoaded setContent({String content}){
  //   return copyWith(content: content);
  // }


}


