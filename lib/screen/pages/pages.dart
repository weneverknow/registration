import 'package:flutter/material.dart';
import 'package:registration/screen/components/components.dart';
import 'package:registration/screen/screen_size.dart';
import 'package:registration/theme/theme.dart';
import 'package:registration/screen/widgets/widgets.dart';

part 'first_page.dart';
part 'second_page.dart';
part 'third_page.dart';
part 'fourth_page.dart';

void changeColor(VoidCallback? change) async {
  await Future.delayed(Duration(milliseconds: 800));

  change!.call();
}
