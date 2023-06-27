import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppMeasures.getSize(context).width,
      height: widget.preferredSize.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/icon_logo.svg', width: 50),
            SizedBox(
              child: Row(
                children: [
                  const Text('250'),
                  SizedBox(
                    width: AppMeasures.getSize(context).width * 0.02,
                  ),
                  SvgPicture.asset('assets/topia_coin.svg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
