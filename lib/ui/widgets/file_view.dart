import 'dart:io';

import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:flutter/material.dart';

enum FileStates { idle, uploading, done, error }

class FileView extends StatefulWidget {
  final File file;
  final FileStates state;
  final Function() onDelete;
  const FileView(
      {Key? key,
      required this.file,
      this.state = FileStates.idle,
      required this.onDelete})
      : super(key: key);

  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Card(
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.file(
                  widget.file,
                )),
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: IconButton(
                onPressed: () {
                  widget.onDelete();
                },
                icon: Icon(Icons.delete))),
        Center(
            child: SizedBox(
                height: 20,
                width: 20,
                child: LoadingView(
                  isVisible: widget.state == FileStates.uploading,
                ))),
        Visibility(
          visible: widget.state == FileStates.done,
          child: Center(
              child: Icon(
            Icons.done_all_rounded,
            size: 30,
          )),
        )
      ],
    );
  }
}
