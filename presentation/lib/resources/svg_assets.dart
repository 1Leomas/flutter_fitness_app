import 'package:fitness_app_flutter/resources/custom_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets {
  static SvgPicture iconPlay = SvgPicture.asset('resources/svg/icon_play.svg');
  static SvgPicture iconPlayWhite = SvgPicture.asset('resources/svg/icon_play.svg', color: CustomColors.white,);
  static SvgPicture iconPause = SvgPicture.asset('resources/svg/icon_pause.svg');
  static SvgPicture iconClock = SvgPicture.asset('resources/svg/icon_clock.svg');
  static SvgPicture iconFire = SvgPicture.asset('resources/svg/icon_fire.svg');
  static SvgPicture svgBack = SvgPicture.asset('resources/svg/svg_back.svg');
}