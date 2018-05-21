import 'package:flutter/material.dart';
import 'package:nutri_quest/pager_indicator.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF56FFF4),
      '',
      'HAHA 1',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis, dui nec fermentum molestie, ligula eros gravida augue, sed tincidunt magna enim quis tortor.',
      ''
  ),
  new PageViewModel(
      const Color(0xFF566FF4),
      '',
      'HAHA 2',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis, dui nec fermentum molestie, ligula eros gravida augue, sed tincidunt magna enim quis tortor.',
      ''
  ),
  new PageViewModel(
    const Color(0xFFf44242),
    '',
    'HAHA 3',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sagittis, dui nec fermentum molestie, ligula eros gravida augue, sed tincidunt magna enim quis tortor.',
    '',
  ),
];

class Page extends StatelessWidget {

  final PageViewModel viewModel;
  final double percentVisible;
  final SlideDirection slidy;
  var direcctione = 0;
  Page({
    this.slidy,
    this.viewModel,
    this.percentVisible = 1.0,

  }){
    //setDirecction();
  }

  /*void setDirecction(){
    if(slidy == SlideDirection.leftToRight) {
      debugPrint('holaxd');
      direcctione = -1;
    }
    else if(){
      debugPrint("no hola");direcctione = 1;
    }
    //slidy == SlideDirection.leftToRight ? direcctione = 1 : {direcctione = -1, debugPrint('voy a la derecha')};
  }*/

  @override
  Widget build(BuildContext context) {
    //setDirecction();
    return new Container(
        width: double.INFINITY,
        color: viewModel.color,
        child: new Center(

          child: new Opacity(
            opacity: percentVisible,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Transform(
                    transform: new Matrix4.translationValues(0.0, 0.0,  0.0),
                    child: new Padding(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      child: new Text(
                        viewModel.title,
                        style: new TextStyle(
                          color: Colors.black,
                          fontFamily: 'FlamanteRoma',
                          fontSize: 34.0,
                        ),
                      ),
                    ),
                  ),
                  new Transform(
                    transform: new Matrix4.translationValues(0.0, 0.0,  0.0),
                    child: new Padding(
                      padding: new EdgeInsets.only(bottom: 75.0, left: 20.0, right: 20.0),
                      child: new Text(
                        viewModel.body,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Colors.black12,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}