import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/models/category_model.dart';
import 'package:quiz/providers/category_provider.dart';
import 'package:quiz/widgets/background_custom.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.primaries[index],
                        ),

                        child: Align(
                          child: Text(data[index].name),
                        ),
                      );
                    },
                  );
                }else{
                  return Container(
                    child: const Center(
                      child: Text('No data'),
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
