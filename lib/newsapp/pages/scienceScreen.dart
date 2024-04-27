import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:bmicalclutor/newsapp/data/models/news_model.dart';
import 'package:bmicalclutor/newsapp/data/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/bloc/cubit.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var science = NewsCubit.get(context).science;
        return AnimatedConditionalBuilder(
          condition: science.length > 0,
          fallback: (context) {
            return Center(child: CircularProgressIndicator());
          },
          builder: (context) {
            List randomImages = [
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV5-hEA_n2ceRLJZy0uncsn7LpAAk-vv0oog&usqp=CAU',
              'https://m.media-amazon.com/images/I/61zPbLbnWCL._AC_UF1000,1000_QL80_.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1QnzSaC4zP2KEwBcUwcd9-rzoX3Xw_QVEu2__w9MXyYek0C0Yu_xYKA_x39P3h53sqcU&usqp=CAU',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwqZ-zb2qTOtOweCYuk-USbay-ZWH-Gk3zYA&usqp=CAU',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZs5du5eSbr04rihJ1tX6GF_PtrwBWKTH1wQ&usqp=CAU',
            ];

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                NewsModel newsItem = science[index];

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage('${randomImages[index]}'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  newsItem.title,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                newsItem.date,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                  width: double.infinity, height: 1.0, color: Colors.grey[300]),
              itemCount: 5,
            );
          },
        );
      },
    );
  }
}
