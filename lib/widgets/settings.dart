import 'package:flutter/material.dart';
import 'package:screen_orientation/enums/navigation_rail_position.dart';
import 'package:screen_orientation/enums/navigation_rail_type.dart';

class Settings extends StatefulWidget {
  final Function(bool useLeading) onTapLeading;
  final Function(bool hideLeadingTraining) onHideLeadingTrailing;
  final Function(double railWidth) onChangeRailWidth;
  final Function(bool useIndicator) onShowIndicator;
  final Function(NavigationRailLabelType) onLabelType;
  final Function(double railPositio) onPositionedChanged;

  const Settings(
      {Key? key,
      required this.onTapLeading,
      required this.onChangeRailWidth,
      required this.onShowIndicator,
      required this.onLabelType,
      required this.onPositionedChanged,
      required this.onHideLeadingTrailing})
      : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool useLeading = true;
  double railWidth = 50;
  bool useIndicator = true;
  NavigationRailType labelType = NavigationRailType.all;
  NavigationRailGroupAlignment groupAlignment =
      NavigationRailGroupAlignment.top;
  bool hideLeadingTrailing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
            title: const Text("Hide Leading Trailing"),
            value: hideLeadingTrailing,
            onChanged: (value) {
              setState(() {
                hideLeadingTrailing = value!;
                  widget.onHideLeadingTrailing(hideLeadingTrailing);

              });
            }),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Visibility(
                    visible: !hideLeadingTrailing,
                    child: SwitchListTile(
                        title: const Text("Leading"),
                        value: useLeading,
                        onChanged: (value) {
                          setState(() {
                            useLeading = value;
                            widget.onTapLeading(useLeading);
                          });
                        }),
                  ),
                  Slider(
                      label: "Rail Width",
                      divisions: 10,
                      min: 50,
                      max: 150,
                      value: railWidth,
                      onChanged: (value) {
                        setState(() {
                          railWidth = value;
                          widget.onChangeRailWidth(railWidth);
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("Use Indicator"),
                      value: useIndicator,
                      onChanged: (value) {
                        setState(() {
                          useIndicator = value ?? true;
                          widget.onShowIndicator(useIndicator);
                        });
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Label Type"),
                      DropdownButton<NavigationRailType>(
                          value: labelType,
                          items: NavigationRailType.values
                              .map((e) => DropdownMenuItem<NavigationRailType>(
                                  value: e, child: Text(e.name)))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              labelType = value!;
                              widget.onLabelType(labelType.labelType);
                            });
                          })
                    ],
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Visibility(
                    visible: !hideLeadingTrailing,
                    child: SwitchListTile(
                        title: const Text("Trailing"),
                        value: !useLeading,
                        onChanged: (value) {
                          useLeading = !value;
                          widget.onTapLeading(useLeading);
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Position"),
                      DropdownButton<NavigationRailGroupAlignment>(
                          value: groupAlignment,
                          items: NavigationRailGroupAlignment.values
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e.name)))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              groupAlignment = value!;
                              widget.onPositionedChanged(groupAlignment.position);
                            });
                          })
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}
