import 'package:flutter/material.dart';
import 'package:flutter_for_web/core/utils/assets_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.stacked_bar_chart,
      Icons.email,
      Icons.analytics,
      Icons.settings,
    ];
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Image.asset(
            AssetsData.logo,
          ),
          const Spacer(flex: 1),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (context, index) => _buildIcon(icons[index]),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }

  IconButton _buildIcon(IconData icon) {
    return IconButton(
      onPressed: () {},
      color: const Color(0xFF3A86FF).withAlpha(155),
      iconSize: 40.sp,
      icon: Icon(icon),
    );
  }
}
