import 'package:core_config/config.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('EXAMPLE'),
      ),
      body: SizedBox.expand(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.featured_play_list_outlined),
              trailing: Icon(Icons.touch_app),
              title: Text('LANGUAGE'),
              isThreeLine: true,
              subtitle: Text('Select Language'),
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'SwitchLanguageScreen');
              },
            ),
            ListTile(
              leading: Icon(Icons.featured_play_list_outlined),
              trailing: Icon(Icons.touch_app),
              title: Text('NOTIFICATION'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'NotificationScreen');
              },
              subtitle: Text('Notification Feature'),
            ),
            ListTile(
              leading: Icon(Icons.storage),
              trailing: Icon(Icons.touch_app),
              title: Text('STORAGE'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'StorageScreen');
              },
              subtitle: Text('Storage Feature'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.touch_app),
              title: Text('CRYPTO'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'AesScreen');
              },
              subtitle: Text('Aes Encrypt'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.touch_app),
              title: Text('CRYPTO'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'Ed25519Screen');
              },
              subtitle: Text('ED25519 Encrypt'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.touch_app),
              title: Text('CRYPTO'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'RsaScreen');
              },
              subtitle: Text('RSA Encrypt'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.touch_app),
              title: Text('CRYPTO'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'SalsaScreen');
              },
              subtitle: Text('Salsa Encrypt'),
            ),
            ListTile(
              leading: Icon(Icons.face),
              trailing: Icon(Icons.touch_app),
              title: Text('MLKIT'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'FaceDetectorScreen');
              },
              subtitle: Text('Face Detector'),
            ),
            ListTile(
              leading: Icon(Icons.camera),
              trailing: Icon(Icons.touch_app),
              title: Text('MLKIT'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'ImageLabelerScreen');
              },
              subtitle: Text('Image Labeler'),
            ),
            ListTile(
              leading: Icon(Icons.camera),
              trailing: Icon(Icons.touch_app),
              title: Text('MLKIT'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'ObjectDetectorScreen');
              },
              subtitle: Text('Object Detector'),
            ),
            ListTile(
              leading: Icon(Icons.video_call),
              trailing: Icon(Icons.touch_app),
              title: Text('WEB RTC'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'ListRoomScreen');
              },
              subtitle: Text('List Room RTC'),
            ),
            ListTile(
              leading: Icon(Icons.featured_play_list_outlined),
              trailing: Icon(Icons.touch_app),
              title: Text('PAGINATION'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'PaginationScreen');
              },
              subtitle: Text('Go To Pagination'),
            ),
            ListTile(
              leading: Icon(Icons.featured_play_list_outlined),
              trailing: Icon(Icons.touch_app),
              title: Text('CTU PAGINATION'),
              isThreeLine: true,
              onTap: () async {
                context.pushNamed('MappExampleRoute', 'CtuPaginationScreen');
              },
              subtitle: Text('Go To CTU Pagination'),
            ),
          ],
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //         onPressed: () async {
        //           context.pushNamed('MappExampleRoute', 'SwitchLanguageScreen');
        //         },
        //         child: Text('SWITCH LANGUAGE'),
        //     ),
        //     ElevatedButton(
        //       onPressed: () async {
        //         context.pushNamed('MappExampleRoute', 'NotificationScreen');
        //       },
        //       child: Text('NOTIFICATION'),
        //     ),
        //     ElevatedButton(
        //       onPressed: () async {
        //         context.pushNamed('MappExampleRoute', 'StorageScreen');
        //       },
        //       child: Text('STORAGE'),
        //     ),
        //     ElevatedButton(
        //       onPressed: () async {
        //         context.pushNamed('MappExampleRoute', 'LocatorScreen');
        //       },
        //       child: Text('LOCATOR'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
