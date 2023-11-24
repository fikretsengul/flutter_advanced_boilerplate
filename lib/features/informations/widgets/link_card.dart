import 'package:flutter/material.dart';
import 'package:flutter_advanced_boilerplate/utils/methods/shortcuts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
    required this.title,
    required this.icon,
    required this.url,
  });

  final String title;
  final IconData icon;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: getPrimaryColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: ListTile(
        onTap: _launchUrl,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        trailing: Icon(MdiIcons.link),
        title: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(
              title,
              style:
                  getTextTheme(context).titleMedium!.apply(fontWeightDelta: 2),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _launchUrl() async => await canLaunchUrl(url)
      ? await launchUrl(url)
      : throw Exception('Could not launch $url');
}
