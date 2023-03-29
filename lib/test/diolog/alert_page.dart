import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AlertPage extends StatelessWidget {

   AlertPage({super.key});
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("普通方式"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('OK Dialog'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (onWillPop: false)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                onWillPop: () => Future.value(false),
              );
              assert(result == OkCancelResult.ok);
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (barrierDismissible: false)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                barrierDismissible: false,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (Custom okLabel)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'YES!',
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (No Title)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                message: 'This is message.',
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (No Message)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (Theme builder)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                builder: (context, child) => Theme(
                  data: ThemeData(
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange,
                      ),
                    ),
                  ),
                  child: child,
                ),
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (Default: Cancel)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                defaultType: OkCancelAlertDefaultType.cancel,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (Destructive)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                isDestructiveAction: true,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (long button label)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Long OK' * 2,
                cancelLabel: 'Long Cancel' * 2,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (useActionSheetForCupertino)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                isDestructiveAction: true,
                cancelLabel: 'No!',
                useActionSheetForIOS: true,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text(
              'Yes/No Dialog (fullyCapitalizedForMaterial: true)',
            ),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Yes',
                cancelLabel: 'Decline It',
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text(
              'Yes/No Dialog (fullyCapitalizedForMaterial: false)',
            ),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Yes',
                cancelLabel: 'Decline It',
                fullyCapitalizedForMaterial: false,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('Confirmation Dialog (few selections)'),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    5,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text(
              'Confirmation Dialog (few selections / default selection)',
            ),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    5,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
                initialSelectedActionKey: 1,
              );
              logger.i(result);
            },
          ),
          ListTile(
            title: const Text('Confirmation Dialog (many selections)'),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    20,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
                shrinkWrap: false,
              );
              logger.i(result);
            },
          ),
        ],
      ),
    );
  }
}
