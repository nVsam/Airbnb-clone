import 'package:airbnb/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class PropertyTypeList extends StatelessWidget {
  const PropertyTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    final List<Map<String, dynamic>> propertyTypes = [
      {'type': 'Hotel', 'icon': Icons.hotel},
      {'type': 'Apartamento', 'icon': Icons.apartment},
      {'type': 'BnB', 'icon': Icons.bedroom_child},
      {'type': 'Villa', 'icon': Icons.villa},
      {'type': 'Resort', 'icon': Icons.holiday_village},
    ];

    return SizedBox(
      height: 56.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: propertyTypes.length,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.2,
            child: Column(
              children: [
                Icon(
                  propertyTypes[index]['icon'],
                ),
                Text(
                  propertyTypes[index]['type'],
                  style: textTheme.bodySmall,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}