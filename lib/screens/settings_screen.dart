import 'package:chatgpt_new/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SettingsWindow());
  }
}

class SettingsWindow extends HookConsumerWidget {
  const SettingsWindow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(settingListProvider);
    final controller = useTextEditingController();

    return ListView.separated(
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle ?? 'Unknown'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              //点击弹出编辑窗口
              final text = await showEditor(controller, item, ref);
              if (text == null) return;
              switch (item.key) {
                case SettingKey.apiKey:
                  ref.read(settingStateProvider.notifier).setApiKey(text);
                  break;
                case SettingKey.baseUrl:
                  ref.read(settingStateProvider.notifier).setBaseUrl(text);
                  break;
                case SettingKey.httpProxy:
                  ref.read(settingStateProvider.notifier).setHttpProxy(text);
                  break;
                default:
                  break;
              }
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: items.length);
  }

  Future<String?> showEditor(
      TextEditingController controller, SettingItem item, WidgetRef ref) async {
    controller.text = item.subtitle ?? '';
    return await showDialog<String?>(
        context: ref.context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      final text = controller.text;
                      controller.clear();
                      Navigator.of(context).pop(text);
                    },
                    child: const Text('OK'))
              ],
              title: Text(item.title),
              content: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: item.hint),
              ),
            ));
  }
}
