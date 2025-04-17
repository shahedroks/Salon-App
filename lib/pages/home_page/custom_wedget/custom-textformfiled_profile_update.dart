import 'package:flutter/material.dart';

class CustomTextFormFieldProfileUpdate extends StatelessWidget {
  String? name;
  var controlerName;
  IconData? prefixIcon;
  bool? enableField;
  bool? biofield;

  CustomTextFormFieldProfileUpdate({
    super.key,
    this.name,
    this.controlerName,
    this.prefixIcon,
    this.enableField = true,
    this.biofield = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SizedBox(
      height: biofield == false ? height * 0.06 : height * 0.11,
      child: TextFormField(
        maxLines: biofield == true ? 3 : 1,
        enabled: enableField,
        controller: controlerName,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: "$name",
        ),
      ),
    );
  }
}
