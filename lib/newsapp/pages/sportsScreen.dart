import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:bmicalclutor/newsapp/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/bloc/cubit.dart';
import '../data/bloc/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var sports = NewsCubit.get(context).sports;
        return AnimatedConditionalBuilder(
          condition: sports.length > 0,
          fallback: (context) {
            return Center(child: CircularProgressIndicator());
          },
          builder: (context) {
            List randomImages = [
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7KFh6PgfGzilzRlUNRuLcy6Y83z5FYQ8IMg&usqp=CAU',
              'https://assets.publishing.service.gov.uk/government/uploads/system/uploads/image_data/file/177957/s960_MicrosoftTeams-image__1_.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3fkwJcx_1P5lSuEY3NbQXt_Hd6KwIYPRh-Q&usqp=CAU',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq9cSw6EYTEAJ-xo6gmsisRXc_H22XZSCIrg&usqp=CAU',
              'data:image/jpeg;base64,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',
            ];

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                NewsModel newsItem = sports[index];

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
