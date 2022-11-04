import 'package:flutter/material.dart';
import 'package:screen_orientation/constants.dart';
import 'package:screen_orientation/enums/indicator_color_types.dart';
import 'package:screen_orientation/enums/navigation_rail_type.dart';
import 'package:screen_orientation/extensions/context_extensions.dart';
import 'package:screen_orientation/widgets/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  double groupAlignment = -1.0;
  bool useLeading = true;
  double railWidth = 60;
  bool useIndicator = true;
  Color indicatorColor = IndicatorColorTypes.values.first.color;
  NavigationRailLabelType labelType = NavigationRailType.values.first.labelType;
  bool hideLeadingTrailing = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            context.isPortrait ? "Bottom Navigation" : "Navigation Rail",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: context.isPortrait
            ? BottomNavigationBar(
                backgroundColor: Colors.red,
                items: Constants.bottomNavigationItemList,
                selectedIconTheme: Constants.selectedIconTheme,
                unselectedIconTheme: Constants.unselectedIconTheme,
                unselectedLabelStyle: Constants.unselectedLabelStyle,
                selectedLabelStyle: Constants.selectedLabelStyle,
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              )
            : null,
        body: Row(
          children: [
            if (!context.isPortrait)
              NavigationRail(
                selectedIndex: selectedIndex,
                backgroundColor: Colors.red,
                leading: useLeading && !hideLeadingTrailing
                    ? const IconButton(
                        icon: Constants.navigationRailLeadingIcon,
                        onPressed: null,
                      )
                    : null,
                trailing: !useLeading && !hideLeadingTrailing
                    ? const IconButton(
                        icon: Constants.navigationRailTrailingIcon,
                        onPressed: null,
                      )
                    : null,
                elevation: 10,
                destinations: Constants.navigationDestinationList,
                selectedIconTheme: Constants.selectedIconTheme,
                unselectedIconTheme: Constants.unselectedIconTheme,
                labelType: labelType,
                groupAlignment: groupAlignment,
                indicatorColor: indicatorColor,
                useIndicator: useIndicator,
                minWidth: railWidth,
                selectedLabelTextStyle: Constants.selectedLabelStyle,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            if (!context.isPortrait )
              const VerticalDivider(
                width: 1,
                thickness: 1,
              ),
            Expanded(
              child: context.isPortrait
                  ? const Center(
                      child: Text("Rotate your phone for navigation rail"))
                  : Settings(
                      onTapLeading: (value) {
                        setState(() {
                          useLeading = value;
                        });
                      },
                      onChangeRailWidth: (value) {
                        setState(() {
                          railWidth = value;
                        });
                      },
                      onShowIndicator: (value) {
                        setState(() {
                          useIndicator = value;
                        });
                      },
                      onLabelType: (value) {
                        setState(() {
                          labelType = value;
                        });
                      },
                      onPositionedChanged: (value) {
                        setState(() {
                          groupAlignment = value;
                        });
                      },
                      onHideLeadingTrailing: (value) {
                        setState(() {
                          hideLeadingTrailing = value;
                        });
                      },
                      onIndicatorColorChanged: (value) {
                        setState(() {
                          indicatorColor = value.color;
                        });
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
