import 'package:fluent_ui/fluent_ui.dart';
import 'package:memory_r/theme/global_theme.dart';

class RamInfoTile extends StatelessWidget {
  final IconData? icon;
  final double? ramLenght;
  final String? caption;
  const RamInfoTile({super.key, this.icon, this.ramLenght, this.caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        spacing: 8,
        children: [
          WindowsIcon(icon ?? WindowsIcons.ram),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                caption ?? 'Total Memory',
                style: TextStyle(fontSize: GlobalTheme.secondaryFontSize),
              ),
              Text('${(ramLenght ?? 16.0).toStringAsFixed(1)} GB'),
            ],
          ),
        ],
      ),
    );
  }
}
