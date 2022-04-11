import 'package:app_news/modulse/news_Screen/web_screen/web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget formfield(context,{
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required FormFieldValidator<String>? validat,
  ValueChanged<String>? onchange,
  ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? ontap,
  Widget? pre_icon,
  Widget? suf_icon,
  TextStyle? labelStyle,
  InputBorder? focusedBorder,
  InputBorder? enabledBorder,
  bool obscure = false,
  bool onlyread = false,
}) =>
    TextFormField(
        style: Theme
            .of(context)
            .textTheme
            .bodyText2,
        controller: controller,
        keyboardType: type,
        onChanged: onchange,
    onFieldSubmitted: onFieldSubmitted,
    onTap: ontap,
        readOnly: onlyread,
        obscureText: obscure,
        validator: validat,
    decoration: InputDecoration(
    labelText: label,
        prefixIcon: pre_icon,
        suffixIcon: suf_icon,
        labelStyle: labelStyle,
    focusedBorder: focusedBorder,
    enabledBorder: enabledBorder,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
,
)
,
);

Widget title({String? data}) {
  return Center(
      child: Text(
        "${data}",
        style: const TextStyle(fontSize: 30, color: Colors.blue),
      ));
}

//news Screenss
Widget buildNews({required articles, required context}) {
  return InkWell(
    //هي يلي بتخليني بقلب اليست اني احسن اضغط عليها
    onTap: () {
      navigator(context, WebViewS(articles['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10) //تذكر بوردير رديووسسس
              ,
              image: DecorationImage(
                image: NetworkImage(
                  "${articles["urlToImage"]}",
                ),
                fit: BoxFit.cover, //طريقة عرض الصورة
              ),
            ),
          ),
          const SizedBox(
            width: 20,
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
                      "${articles["title"]}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${articles["author"]} ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget padContainer() =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 1,
        color: Colors.grey[100],
      ),
    );

Widget buildList(list, context, {bool enable = false}) {
  if (list.length > 0) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        //تعليمة مشان سكرول بس تخلص داتا ما يعطي ظل
        itemBuilder: (context, index) =>
            buildNews(articles: list[index], context: context),
        separatorBuilder: (context, index) => padContainer(),
        itemCount: list.length);
  } else {
    return !enable
        ? const Center(
      child: CircularProgressIndicator(), //هون مشان علامة لودنغ
    )
        : Container();
  }
}

navigator(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}
