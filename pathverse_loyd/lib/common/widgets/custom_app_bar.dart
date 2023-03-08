import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';

class CustomAppBar {
  static AppBar userPageAppBar({required int userId}) {
    return AppBar(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      backgroundColor: Colors.indigo.shade800,
      foregroundColor: Colors.white,
      centerTitle: false,
      elevation: 1,
      toolbarHeight: 66,
      title: Text("User$userId"),
      actions: [
        IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {},
        ),
      ],
    );
  }

  static AppBar homeLandingAppBar({
    required bool isShowSearchBar,
    required Function(bool) updateSearchBar,
    required bool isHideSidebar,
    required Function(bool) updateHideSidebar,
  }) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
      ),
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      title: SizedBox(
        child: Row(
          children: [
            SizedBox(
                width: 28,
                height: 28,
                child: Image.asset("assets/images/logo.png")),
            const SizedBox(
              width: 6,
            ),
            Text("PATHVERSE",
                style: AppTextTheme.styleW700.copyWith(
                    fontSize: 20, color: Colors.white, letterSpacing: 2.6)),
          ],
        ),
      ),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 1.1,
      toolbarHeight: 66,
      bottom: isShowSearchBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(58.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    Container(
                      height: 44.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14))),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "What user Id are you searching for?",
                              style: AppTextTheme.styleW400.copyWith(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    )
                  ],
                ),
              ),
            )
          : null,
      leading: IconButton(
        icon: Icon(isHideSidebar ? Icons.menu : Icons.segment),
        onPressed: () => updateHideSidebar(!isHideSidebar),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => updateSearchBar(!isShowSearchBar),
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
