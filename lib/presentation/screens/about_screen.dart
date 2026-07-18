import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memory_r/config/app_info.dart';
import 'package:memory_r/presentation/screens/screen_layout.dart';
import 'package:memory_r/presentation/widgets/info_container.dart';
import 'package:memory_r/providers/services_providers.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InfoContainer(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                  child: Image.asset('assets/images/icons/logotipo.png'),
                ),
                SizedBox(height: 5),
                Text('version: ${AppInfo.version}'),
                SizedBox(height: 15),
                SizedBox(
                  width: 100,
                  child: Consumer(
                    builder: (context, ref, child) => Button(
                      onPressed: () {
                        final url = Uri.parse(
                          'https://github.com/Andzzio/memory_r',
                        );
                        ref
                            .read(urlLauncherServiceProvider)
                            .launchInBrowser(url);
                      },
                      child: Row(
                        spacing: 15,
                        children: [
                          FaIcon(FontAwesomeIcons.github),
                          Text('Github'),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Copyright © 2026 Andzzio. All rights reserved.',
                  style: TextStyle(fontSize: 11),
                ),
                Text('Third-party licenses', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
