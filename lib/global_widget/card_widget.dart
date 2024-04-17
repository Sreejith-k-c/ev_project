import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  final IconData icons;
  final String iconName;
  final Widget pageName;
 final Null Function() onTap;

  const CardWidget({
    Key? key,
    required this.icons,
    required this.iconName,
    required this.pageName, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey[200],
        child: InkWell(
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            horizontalTitleGap: 30,
            leading: Icon(
              icons,
              color: Colors.black,
            ),
            title: Text(iconName),
            trailing: const Icon(Icons.navigate_next),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pageName));
          },
        ),
      );
}
