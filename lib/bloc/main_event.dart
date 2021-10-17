import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}
class GetLoadData extends MainEvent {
  final String? content;
  const GetLoadData({this.content});

  @override
  List<Object> get props => [ content ?? ''];
}
