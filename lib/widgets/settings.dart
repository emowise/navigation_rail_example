import 'package:flutter/material.dart';
import 'package:screen_orientation/enums/background_color_types.dart';
import 'package:screen_orientation/enums/indicator_color_types.dart';
import 'package:screen_orientation/enums/navigation_rail_position.dart';
import 'package:screen_orientation/enums/navigation_rail_type.dart';
import 'package:screen_orientation/widgets/dropdown_list_tile.dart';

class Settings extends StatefulWidget {
  final Function(bool) onTapLeading;
  final Function(bool) onHideLeadingTrailing;
  final Function(double) onChangeRailWidth;
  final Function(bool) onShowIndicator;
  final Function(NavigationRailLabelType) onLabelType;
  final Function(double) onPositionedChanged;
  final Function(IndicatorColorTypes) onIndicatorColorChanged;
  final Function(BackgroundColorTypes) onBackGroundColorChanged;

  const Settings(
      {Key? key,
      required this.onTapLeading,
      required this.onChangeRailWidth,
      required this.onShowIndicator,
      required this.onLabelType,
      required this.onPositionedChanged,
      required this.onHideLeadingTrailing,
      required this.onIndicatorColorChanged,
      required this.onBackGroundColorChanged})
      : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool useLeading = true;
  double railWidth = 60;
  bool useIndicator = true;
  NavigationRailType labelType = NavigationRailType.all;
  NavigationRailGroupAlignment groupAlignment =
      NavigationRailGroupAlignment.top;
  IndicatorColorTypes indicatorColorType = IndicatorColorTypes.white;
  bool hideLeadingTrailing = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 50,
              child: CheckboxListTile(
                title: const Text("Hide Leading & Trailing"),
                value: hideLeadingTrailing,
                onChanged: (value) {
                  setState(() {
                    hideLeadingTrailing = value!;
                    widget.onHideLeadingTrailing(hideLeadingTrailing);
                  });
                },
              ),
            ),
            Visibility(
                visible: !hideLeadingTrailing,
                child: SizedBox(
                  height: 50,
                  child: SwitchListTile(
                      title: const Text("Leading"),
                      value: useLeading,
                      onChanged: (value) {
                        setState(() {
                          useLeading = value;
                          widget.onTapLeading(useLeading);
                        });
                      }),
                )),
            Visibility(
              visible: !hideLeadingTrailing,
              child: SizedBox(
                height: 50,
                child: SwitchListTile(
                    title: const Text("Trailing"),
                    value: !useLeading,
                    onChanged: (value) {
                      useLeading = !value;
                      widget.onTapLeading(useLeading);
                    }),
              ),
            ),
            SizedBox(
              height: 50,
              child: Slider(
                  label: "Rail Width",
                  divisions: 10,
                  min: 60,
                  max: 150,
                  value: railWidth,
                  onChanged: (value) {
                    setState(() {
                      railWidth = value;
                      widget.onChangeRailWidth(railWidth);
                    });
                  }),
            ),
            SizedBox(
              height: 50,
              child: CheckboxListTile(
                  title: const Text("Use Indicator"),
                  value: useIndicator,
                  onChanged: (value) {
                    setState(() {
                      useIndicator = value ?? true;
                      widget.onShowIndicator(useIndicator);
                    });
                  }),
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            DropdownListTile<IndicatorColorTypes>(
                items: IndicatorColorTypes.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: (value) {
                  widget.onIndicatorColorChanged(value!);
                },
                label: const Text("Indicator Color")),
            DropdownListTile<NavigationRailType>(
                label: const Text("Label Type"),
                items: NavigationRailType.values
                    .map((e) => DropdownMenuItem<NavigationRailType>(
                        value: e, child: Text(e.name)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    labelType = value!;
                    widget.onLabelType(labelType.labelType);
                  });
                },
                labelType: labelType),
            DropdownListTile<NavigationRailGroupAlignment>(
              items: NavigationRailGroupAlignment.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  groupAlignment = value!;
                  widget.onPositionedChanged(groupAlignment.position);
                });
              },
              labelType: groupAlignment,
              label: const Text("Position"),
            ),
            DropdownListTile<BackgroundColorTypes>(
                items: BackgroundColorTypes.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: (value) {
                  widget.onBackGroundColorChanged(value!);
                },
                label: const Text("Background Color"))
          ],
        ))
      ],
    );
  }
}
