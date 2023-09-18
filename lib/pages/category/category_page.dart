import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz/apps/routers/router_name.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/models/category_model.dart';
import 'package:quiz/providers/category_provider.dart';
import 'package:quiz/widgets/background_custom.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left,
          color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Choice an Option"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const BackgroundCustom(),
          SafeArea(
            child: FutureBuilder(
              future: context.read<CategoryProvider>().getListTopic(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Category> data = snapshot.data as List<Category>;
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: paddingCustom(context)),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 2/1,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          context.goNamed(RoutersName.articleName,extra: {
                            'id': data[index].id,
                            'name':data[index].name
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.primaries[index],
                          ),

                          child: Align(
                            child: Text(data[index].name),
                          ),
                        ),
                      );
                    },
                  );
                }else{
                  return Container(
                    child: const Center(
                      child: Text("let's choice a language"),
                    ),
                  );
                }
              },
            )
          )
        ],
      ),
    );
  }
}
