import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> images;

  const ImageViewer({Key? key, required this.images}) : super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
      body: PageView.builder(

          itemCount: widget.images.length,
          itemBuilder: (_, index) {
            return Image.network(widget.images[index],fit: BoxFit.cover,);
          }),
    ));
  }
}
