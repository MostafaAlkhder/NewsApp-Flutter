import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:bmicalclutor/newsapp/data/bloc/cubit.dart';
import 'package:bmicalclutor/newsapp/data/models/news_model.dart';
import 'package:bmicalclutor/newsapp/data/bloc/states.dart';
import 'package:bmicalclutor/newsapp/pages/webView.dart';
import 'package:bmicalclutor/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<NewsModel> business = NewsCubit.get(context).business;
        return AnimatedConditionalBuilder(
          condition: business.length > 0,
          fallback: (context) {
            return Center(child: CircularProgressIndicator());
          },
          builder: (context) {
            List randomImages = [
              'https://bna-media.s3-eu-west-1.amazonaws.com/Media/Images/News/Arab-News/%D8%A7%D9%84%D8%A8%D8%B1%D9%84%D9%85%D8%A7%D9%86%20%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A-f0564f31-6136-4d95-9ed0-e9c064793a33.jpeg',
              'https://play-lh.googleusercontent.com/3RvQX5qfET-nLzco0LkD7r9tSK6zr3QU2V4w7JhVeWv0e6XONUsrtBJrEYktF27lRDE',
              'https://i.ytimg.com/vi/2LJnzG_GM7Y/maxresdefault.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnypcRF0GA_9mgyI1g71h0POj1B97N7LK8vPr9-aRCdPnRmYhCBpmbZgq4UWHMuZk4e3M&usqp=CAU',
              'https://www.arabnews.com/sites/default/files/styles/n_670_395/public/main-image/2023/10/05/4035626-1117030454.jpeg?itok=FiknICW4'
            ];
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                NewsModel newsItem = business[index];

                return InkWell(
                  onTap: () {
                    navigateTo(context, WebViewScreen(newsItem.url));
                    // print(newsItem.url);
                  },
                  child: Padding(
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
