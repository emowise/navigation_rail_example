enum NavigationRailGroupAlignment {
  top("Top",-1.0),
  center("Center",0.0),
  bottom("Bottom",1.0);
  final double position;
  final String name;
  const NavigationRailGroupAlignment(this.name,this.position);
}