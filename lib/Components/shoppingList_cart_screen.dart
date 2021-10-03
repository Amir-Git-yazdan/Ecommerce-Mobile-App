import 'package:dribble_bicycle_shopping_cart/Components/round_icon_button.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image(
                          image: NetworkImage(
                              'https://images-na.ssl-images-amazon.com/images/I/81yPs7rR%2BiL._SX425_.jpg')),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bicycle Red/Yellow',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              r'$859.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                RoundIconButton(
                                  icon: Icon(Icons.remove),
                                  onPress: () {},
                                ),
                                Text(
                                  ' 1 ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 20),
                                ),
                                RoundIconButton(
                                  icon: Icon(Icons.add),
                                  onPress: () {},
                                ),
                              ],
                            ),
                            RoundIconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPress: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
