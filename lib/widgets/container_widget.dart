import 'package:flutter/material.dart';
import 'package:flutter_app/data/constant.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(vertical: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('basic lyout', style: KTextStyle.titleTealText),
              Text('description', style: KTextStyle.descriptionText),
            ],
          ),
        ),
      ),
    );
  }
}
