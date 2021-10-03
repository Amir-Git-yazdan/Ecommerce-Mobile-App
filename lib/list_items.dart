import 'package:dribble_bicycle_shopping_cart/data_model.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  final int index;
  final double imageHeight;

  ListItems({this.index, this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: imageHeight,
            child: Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip
                  .none, //TODO : hint : "instead of using : overflow: Overflow.visible,"
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    placeholderScale: 1.5,
                    image: DataModel.imageAssets[index],
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(DataModel.circleColor[index]),
                          width: 1.5,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    radius: 25,
                  ),
                  right: -8,
                  top: -8,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    DataModel.title[index],
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  child: Text(
                    DataModel.subTitle[index],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
