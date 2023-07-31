import 'package:flutter/material.dart';
import 'package:flutter_for_web/core/utils/assets_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopLayout();
        } else {
          return TabletLayout();
        }
      }),
    ));
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          const SideBar(),
        ],
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        children: [
          const SideBar(),
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      AssetsData.home,
      AssetsData.options,
      AssetsData.msg,
      AssetsData.beforThelast,
      AssetsData.setting
    ];

    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60.w,
            width: 60.w,
            child: SvgPicture.asset(
              AssetsData.logo,
              fit: BoxFit.fill,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ListView.separated(
            itemBuilder: (context, index) {
              return IconButton(
                  onPressed: () {},
                  iconSize: 45.sp,
                  icon: Image.asset(
                    icons[index],
                    fit: BoxFit.fill,
                  ));
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h);
            },
            shrinkWrap: true,
            itemCount: icons.length,
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
