
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_app/repo/main_repository.dart';

import 'main_event.dart';
import 'main_state.dart';


class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(MainRepo detailRepo) : super(MainLoaded());
  MainRepo? detailRepo;

  @override
  Stream<MainState> mapEventToState(event) async*{

    if(event is GetLoadData){
      // if(state is WriteLoaded){
      //   yield (state as WriteLoaded).copyWith(content: event.content);
      // }
    }
    //
    // if(event is ChangeImagePath){
    //   if(state is WriteLoaded){
    //     yield (state as WriteLoaded).copyWith(imagePath: event.path);
    //
    //   }
    // }


  }




}