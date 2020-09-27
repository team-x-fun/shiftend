import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/user/user_state_controller.dart';
import 'package:shiftend/pages/user/widgets/org_select_widget.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';
import 'package:shiftend/util/logger.dart';

class UserPage extends StatelessWidget {
  const UserPage();

  @override
  Widget build(BuildContext context) {
    final user = context.select<LoginState, User>((state) => state.currentUser);
    logger.info('UserPage#build: LoginState = ${context.watch<LoginState>()}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        title: const Text(
          'ユーザページ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.iconUrl),
                    ),
                  ),
                ),
                onTap: () async {
                  logger.info('画像タップ');
                  final mode = await showCupertinoModalPopup<int>(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        message: const Text('写真をアップロードしますか？'),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: const Text(
                              'カメラで撮影',
                            ),
                            onPressed: () {
                              Navigator.pop(context, 0);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text(
                              'アルバムから選択',
                            ),
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('キャンセル'),
                          onPressed: () {
                            Navigator.pop(context, 2);
                          },
                          isDefaultAction: true,
                        ),
                      );
                    },
                  );
                  File imageFile;
                  if (mode == 0) {
                    imageFile = await getImageFromDevice(ImageSource.camera);
                  } else if (mode == 1) {
                    imageFile = await getImageFromDevice(ImageSource.gallery);
                  }
                  await context
                      .read<LoginStateController>()
                      .uploadImage(imageFile);
                },
              ),
              Text('name: ${user.name}'),
              Text('email: ${user.email}'),
              Text('role: ${user.role}'),
              Text('level: ${user.role}'),
              OrgSelectWidget(),
              FlatButton(
                color: Colors.blueGrey,
                child: const Text('新しく組織を作成'),
                onPressed: () {
                  final textController = TextEditingController();
                  showDialog<Widget>(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text('組織の新規作成'),
                        content: TextField(
                          controller: textController,
                          decoration: const InputDecoration(labelText: '組織id'),
                        ),
                        actions: [
                          FlatButton(
                            child: const Text('キャンセル'),
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                          ),
                          FlatButton(
                            child: const Text('作成'),
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              context
                                  .read<UserStateController>()
                                  .createOrganization(
                                      textController.text, user);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> getImageFromDevice(ImageSource source) async {
    final imageFile = await ImagePicker().getImage(source: source);
    if (imageFile == null) {
      return null;
    }
    final compressedFile =
        await FlutterNativeImage.compressImage(imageFile.path, quality: 50);
    return compressedFile;
  }
}
