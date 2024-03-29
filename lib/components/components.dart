import 'package:flutter/material.dart';
import 'package:recipes_app/shared/style/style.dart';

void navigatorPushReplacment(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorPush({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget materialButton(
    {required String text,
    required double font,
    required double raduis,
    required Color colorOfContainer,
    required Color colorOfText,
    required Function() function}) {
  return Container(
    decoration: BoxDecoration(
        color: colorOfContainer, borderRadius: BorderRadius.circular(raduis)),
    child: MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
            fontSize: font, fontWeight: FontWeight.bold, color: colorOfText),
      ),
    ),
  );
}

Widget recipeRecent({
  required String image,
  required String name,
  required String star,
  required bool check,
  required Function() function,
  // required Function() functionFavorites,
  // required bool func,
}) {
  return InkWell(
    onTap: function,
    child: AspectRatio(
        aspectRatio: 7 / 9.5,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(star,
                          style: TextStyle(
                            color: check ? Style.background : Colors.white,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: check ? Style.background : Colors.white,
                      )
                    ],
                  ),
                  // InkWell(
                  //     onTap: functionFavorites,
                  //     child: Icon(
                  //       func ? Icons.bookmark : Icons.bookmark_border_outlined,
                  //       size: 27,
                  //       color: check ? Style.background : Colors.white,
                  //     ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: check ? Style.background : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )),
  );
}

Widget search(
    {required Function(String) function,
    required bool check,
    required TextEditingController textEditingController}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.2,
          color: check ? Colors.black : Colors.white,
        )),
    child: TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 15,
            color: check ? Colors.black : Colors.white,
          )),
      keyboardType: TextInputType.text,
      onChanged: function,
      style: TextStyle(
        fontSize: 17,
        color: check ? Colors.black : Colors.white,
      ),
    ),
  );
}

Widget cardOfListView(
    {required String image,
    required String name,
    required String star,
    required bool check,
    required Function() function,
    required Function() functionFavoritees,
    required bool func}) {
  return InkWell(
    onTap: function,
    child: Container(
      width: double.infinity,
      height: 120,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: check ? Style.background : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 5),
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: check ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                          onTap: functionFavoritees,
                          child: Icon(
                            func
                                ? Icons.bookmark
                                : Icons.bookmark_border_outlined,
                            size: 30,
                            color: check ? Colors.white : Colors.black,
                          ))
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(star,
                              style: TextStyle(
                                color: check ? Colors.white : Colors.black,
                                fontSize: 14,
                              )),
                          Icon(
                            Icons.star,
                            size: 17,
                            color: check ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("|",
                          style: TextStyle(
                            color: check ? Colors.white : Colors.black,
                            fontSize: 14,
                          )),
                      Text("Easy to make",
                          style: TextStyle(
                            color: check ? Colors.white : Colors.black,
                            fontSize: 14,
                          )),
                      const Text("")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget cardOfFavorites({
  required String src,
  required String name,
  required String rate,
  required bool func,
  required Function() functionFavorites,
  required Function() function,
}) {
  return InkWell(
    onTap: function,
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1.2)),
            child: Image.network(
              src,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.48)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                InkWell(
                    onTap: functionFavorites,
                    child: Icon(
                      func ? Icons.bookmark : Icons.bookmark_border_outlined,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.star, size: 30, color: Style.background),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    rate,
                    style: const TextStyle(
                      color: Style.background,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget listTile(
    {required String title,
    required Function() function,
    required bool check}) {
  return InkWell(
    onTap: function,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsetsDirectional.only(start: 8, top: 8, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: check ? Style.background : Colors.white,
      ),
      width: double.infinity,
      height: 80,
      child: ListTile(
        onTap: function,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: check ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        leading: Container(
          height: 120,
          width: 120,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            "assets/splash.png",
            fit: BoxFit.cover,
            color: check ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}

Widget instruction(
    {required int index, required bool check, required String instruction}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: check ? Style.background : Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: Text(
        "${index + 1}",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: check ? Colors.white : Colors.black,
        ),
      ),
      title: Text(
        instruction,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: check ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}

Widget tips({required bool check, required String name, required String body}) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: check ? Style.background : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "data:image/jpeg;base64,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"),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name != "" ? name : "anon",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: check ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    body,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: check ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}

Widget nutrition({required bool check, dynamic nut, required String name}) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: check ? Style.background : Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      "$name:$nut",
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: check ? Colors.white : Colors.black,
      ),
    ),
  );
}
