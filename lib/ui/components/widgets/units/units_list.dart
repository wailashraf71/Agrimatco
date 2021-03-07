import 'package:agrimatco/Model/UnitModel.dart';
import 'package:agrimatco/ui/components/widgets/units/unit_widget.dart';
import 'package:flutter/material.dart';

class UnitsList extends StatelessWidget {
  final List<UnitModel> listofunits;
  final EdgeInsets padding;

  const UnitsList({Key key, this.padding, this.listofunits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: listofunits.length,
      itemBuilder: (BuildContext context, int index) {
        return UnitWidget(
          image: listofunits[index].image,
          title: listofunits[index].name,
          subtitle: listofunits[index].notes,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 15,
        );
      },
    );
  }
}
