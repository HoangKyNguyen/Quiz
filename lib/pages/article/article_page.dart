import 'package:flutter/material.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/pages/article/widgets/article_box_content.dart';
import 'package:quiz/pages/article/widgets/article_loading.dart';
import 'package:quiz/pages/article/widgets/article_title.dart';
import 'package:quiz/widgets/background_custom.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                  padding:EdgeInsets.symmetric(
                    horizontal: paddingCustom(context),
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ArticleTitle(),
                      SizedBox(height: getHeight(context)*0.04),
                      const ArticleLoading(),
                      SizedBox(height: getHeight(context)*0.04),
                      const ArticleBoxContent(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
