import 'package:flutter/material.dart';
import 'package:flutter_advanced_boilerplate/features/features/widgets/components/theme_customizer.dart';
import 'package:flutter_advanced_boilerplate/features/features/widgets/features_list.dart';
import 'package:flutter_advanced_boilerplate/i18n/strings.g.dart';
import 'package:flutter_advanced_boilerplate/utils/methods/shortcuts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      children: [
        Card(
          child: SwitchListTile(
            onChanged: (bool newValue) {
              LocaleSettings.setLocale(newValue ? AppLocale.tr : AppLocale.en);
            },
            value: context.t.$meta.locale == AppLocale.tr,
            title: Row(
              children: [
                Icon(MdiIcons.translate),
                const SizedBox(width: 16),
                Text(
                  context.t.features.use_turkish,
                  style: getTextTheme(context)
                      .titleSmall!
                      .apply(fontWeightDelta: 2),
                ),
              ],
            ),
          ),
        ),
        const ThemeCustomizer(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: getTheme(context).onBackground.withOpacity(0.4),
          ),
        ),
        const SizedBox(height: 16),
        const FeaturesList(),
        const SizedBox(height: 36),
      ],
    );
  }
}
