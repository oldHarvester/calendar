import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    super.key,
    required this.assetPath,
    this.onTap,
    this.size,
  });
  final String assetPath;
  final VoidCallback? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: SvgPicture.asset(
            assetPath,
            height: size,
            width: size,
          ),
        ),
      ),
    );
  }
}
