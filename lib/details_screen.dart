import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsScreen extends StatelessWidget{
  static const String routeName='detailsSreen';
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context){
    News news=ModalRoute.of(context )?.settings.arguments as News;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return  Container(
       decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(news.title??''),
          centerTitle: true,),
           body:  Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? '',
                    placeholder: (_, __) => const LoadingIndicator(),
                    errorWidget: (_, __, ___) => const Center(
                      child: Icon(
                        Icons.error_outline_outlined,
                        size: 40,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  news.source?.name ?? '',
                  style: titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppTheme.lightNavyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  news.title ?? '',
                  style: titleSmall,
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    timeago.format(news.publishedAt!),
                    style: titleSmall?.copyWith(color: AppTheme.lightNavyColor),
                  ),
                ),
                Text(news.description??'',
                textAlign: TextAlign.center,),
                const SizedBox(height: 50,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(onPressed: (){
                      lunchUrl(news.url??'');
                    },
                     icon: const Icon(Icons.arrow_back_ios),
                     label: const Text('View Full Article'),),
                  ),
                )
              ],
                     ),
           ),
      ),
    );
  }
}
void lunchUrl(String url)async{
  final Uri _url = Uri.parse(url);
  bool canLaunch =await canLaunchUrl(_url);
  if (canLaunch){
    launchUrlString(url);
    launchUrl(_url);
  }
  else {
    print('cannot launch');
  }
}


















