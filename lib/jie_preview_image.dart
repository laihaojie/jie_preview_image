library jie_preview_image;

import 'package:flutter/material.dart';

void previewImage(
  BuildContext context, {
  String? currentUrl, // 当前显示的url 没传默认第一个
  required List<String> urls, // 图片url列表
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          PreviewImageWidget(currentUrl: currentUrl, urls: urls),
    ),
  );
}

class PreviewImageWidget extends StatelessWidget {
  final String? currentUrl;
  final List<String> urls;

  const PreviewImageWidget({
    super.key,
    this.currentUrl,
    required this.urls,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: urls.isEmpty
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Material(
                child: Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      '图片不存在',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          : PageView(
              pageSnapping: true, // 是否自动贴合边界
              controller: currentUrl == null
                  ? null
                  : PageController(
                      initialPage: urls.indexOf(currentUrl!),
                    ),
              children: [
                for (int i = 0; i < urls.length; i++)
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: InteractiveViewer(
                      maxScale: 5,
                      child: Image.network(
                        urls[i],
                        fit: BoxFit.fitWidth,
                        loadingBuilder: (
                          context,
                          child,
                          loadingProgress,
                        ) {
                          if (loadingProgress == null) return child;

                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
