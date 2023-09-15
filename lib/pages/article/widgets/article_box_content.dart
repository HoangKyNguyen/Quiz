import 'package:flutter/material.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/a11y-dark.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/apps/utils/parse_html.dart';
import 'package:quiz/pages/article/widgets/article_modal.dart';
import 'package:quiz/widgets/button_custom.dart';

class ArticleBoxContent extends StatefulWidget{
  const ArticleBoxContent({super.key});

  @override
  State<ArticleBoxContent> createState() => _ArticleBoxContentState();

}

class _ArticleBoxContentState extends State<ArticleBoxContent>{
  final PageController pageController =PageController();

  void handleSubmit() async{
   await showModal(context);
  }
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context,index) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            )
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text('asdasdasdasdasdasdasdasdasd',
              style:TextStyle(
                 color: Color(0xff44A3AE)
              ),
              ),
              SizedBox(height: getHeight(context)*0.02),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                ),
               ),
                width: getWith(context),
                child: HighlightView(
                  parseHtmlString(
                      '<p>printf( 03 + 24, "CCCCC", 33, " training");</p>'),
                  theme: a11yDarkTheme,
                  language: 'dark',
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: getHeight(context)*0.02),
              const Text('Your Answer',
              style: TextStyle(
                color: Colors.black
              )
              ),
              SizedBox(height: getHeight(context)*0.02),
              TextFormField(
                onChanged: (_){},
                decoration:const InputDecoration(
                  hintText:"Enter Your Answer"
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value){

                },
                style: const TextStyle(
                ),
              ),
              SizedBox(height: getHeight(context)*0.04),
              ButtonCustom(
                   onTap: handleSubmit,
                  title: 'Show Result')
            ],
          ),
        );
      },
    );
  }
  
}