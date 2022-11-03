import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  final String imageURL;
  final String? name;

  const CustomCard2({Key? key, required this.imageURL, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: AppThemes.primary.withOpacity(0.75),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageURL),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (name != null)
            Container(
              child: Text(name!),
              alignment: AlignmentDirectional.bottomEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            ),
        ],
      ),
    );
  }
}
