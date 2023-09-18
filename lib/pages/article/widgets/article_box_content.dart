import 'package:flutter/material.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/a11y-dark.dart';
import 'package:provider/provider.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/apps/utils/parse_html.dart';
import 'package:quiz/models/question_model.dart';
import 'package:quiz/pages/article/widgets/article_modal.dart';
import 'package:quiz/providers/question_provider.dart';
import 'package:quiz/widgets/button_custom.dart';

class ArticleBoxContent extends StatefulWidget{
  int idTopic;
  ArticleBoxContent({super.key, required this.idTopic});

  @override
  State<ArticleBoxContent> createState() => _ArticleBoxContentState();

}

class _ArticleBoxContentState extends State<ArticleBoxContent>{
  final PageController pageController = PageController();
  String valueInput = '';
  void handleSubmit(Question data) async{
    await showModal(context,valueInput,data);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: context.read<QuestionProvider>().getQuestionList(widget.idTopic),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<Question> data = snapshot.data as List<Question>;
              return ExpandablePageView.builder(
                onPageChanged: (value){
                  context.read<QuestionProvider>().setCurrentData(value);
                },
                controller: pageController,
                itemCount: data.length,
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
                         Text(
                          data[index].title.toString(),
                          style:const TextStyle(
                              color: Color  (0xff44A3AE)
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
                            parseHtmlString(data[index].question),
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
                          onChanged: (value){
                            valueInput = value;
                          },
                          decoration:const InputDecoration(
                              hintText:"Enter Your Answer"
                          ),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value){

                          },
                          style: const TextStyle(
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: getHeight(context)*0.04),
                        ButtonCustom(
                            onTap: ()=>handleSubmit(data[index]),
                            title: 'Show Result')
                      ],
                    ),
                  );
                },
              );
            }else{
                return const Center(
                  child: Text("No data"),
                );
            }
          },

    );
  }
  
}