import 'package:flutter/cupertino.dart';
import 'category_detail.dart';
import '../../models/categories.dart';

class Body extends StatelessWidget {
  int cateId;
  Body(this.cateId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CategoryDetail(cateId),
    );
  }
}
