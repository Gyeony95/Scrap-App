import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NormalRefreshHeader extends StatelessWidget {
  const NormalRefreshHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClassicHeader(
    idleText: '',
    refreshingText: '',
    releaseText: '',
    completeText: '',
    idleIcon: const Icon(
      CupertinoIcons.down_arrow,
      size: 36.0,
    ),
    releaseIcon: const CupertinoActivityIndicator(radius: 14.0),
    refreshingIcon: const CupertinoActivityIndicator(radius: 14.0),
    completeIcon: const CupertinoActivityIndicator(radius: 14.0),
    outerBuilder: (child) => ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcATop,
      ),
      child: Container(
        height: 60.0,
        alignment: Alignment.center,
        child: child,
      ),
    ),
  );
}
