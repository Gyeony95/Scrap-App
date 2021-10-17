
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrap_app/bloc/main_bloc.dart';
import 'package:scrap_app/bloc/main_event.dart';
import 'package:scrap_app/bloc/main_state.dart';
import 'package:scrap_app/widgets/flare_progress.dart';
import 'package:scrap_app/widgets/nomal_refresh_header.dart';

import 'main_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainBloc? _mainBloc;
  final _refreshController = RefreshController(initialRefresh: false);
  static const _mainColor = const Color(0xff867ae9);

  @override
  void initState() {
    super.initState();
    _mainBloc = context.read<MainBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('일기를 써보아요'),
      // ),
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if (state is MainLoaded) {
              _refreshController.refreshCompleted();
            }
          },
          builder: (context, state) {
            if (state is MainLoading) {
              return const Center(child: FlareProgress());
            }
            if (state is MainLoaded) {
              return Ink(
                color: _mainColor,
                child: LayoutBuilder(
                    builder: (context, constraints) => SmartRefresher(
                      enablePullDown: true,
                      header: const NormalRefreshHeader(),
                      // physics: CustomClampingScrollPhysics(
                      //   parent: AlwaysScrollableScrollPhysics(),
                      //   canUnderscroll: true,
                      //   canOverscroll: false,
                      // ),
                      controller: _refreshController,
                      onRefresh: () => _mainBloc!.add(const GetLoadData()),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const MainHeader(mColor : _mainColor),

                              Container(
                                  padding: EdgeInsets.all(20).copyWith(bottom: 0),
                                  child: const Text('포토카드 등록 현황이에요!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xffBEBFE6)),)),


                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: InkResponse(
                                  child:
                                  const Center(child: Text('여기를 눌러 일기를 써보세요!')),
                                  onTap: () => Get.toNamed('/post'),
                                ),
                              ),
                              // CalendarView()
                            ],
                          )),
                    )),
              );
            }
            return Container();
          },
        ));
  }
}
