import 'package:first_flutter_project/widgets/column_layout.dart';
import 'package:first_flutter_project/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';

import '../utils/app_styles.dart';
import '../widgets/layout_builder_widget.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
          //the width reduced the size of the card ticket by 85%
          width: size.width*0.85,
          height: AppLayout.getHeight(GetPlatform.isAndroid==true?230:169),
          child: ListView(
            children: [Container(
              margin:  EdgeInsets.only(right: AppLayout.getHeight(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //blue part of ticket//
                  Container(
                    decoration:  BoxDecoration(
                      color: isColor==null? Colors.blueAccent:Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)), topRight: Radius.circular(AppLayout.getHeight(21)))
                    ),
                    padding:  EdgeInsets.all(AppLayout.getHeight(16)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(ticket['from']['code'],
                              style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3),
                          Expanded(child: Container()),
                           ThickContainer(isColor: isColor,),
                          Expanded(child: Stack
                            (
                            children: [
                              SizedBox(
                              height: AppLayout.getHeight(24),
                              child: AppLayoutBuilderWidget(sections: 6,),
                            ),
                              Center(child: Transform.rotate(angle: 1.5, child: Icon(Icons.local_airport_rounded,color:isColor==null? Colors.white:Color(0xFF8ACCF7),),)),],
                          )),
                           ThickContainer(isColor: isColor),
                          Expanded(child: Container()),
                          Text(ticket['to']['code'],
                              style:isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3)
                        ],
                      ),
                      const Gap(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppLayout.getWidth(100),
                            child: Text(ticket['from']['name'],
                              style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                          ),
                          Text(ticket['flying_time'],
                            style:isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                          SizedBox(
                            width: AppLayout.getWidth(100),
                            child: Text(ticket['to']['name'],textAlign: TextAlign.end, style:isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                          )
                        ],
                      )
                    ],
                  ),),
                  //orange part of the card ticket
                  Container(
                    color:  isColor==null? Colors.deepOrangeAccent:Colors.white ,
                    child: Row(
                      children: [
                          SizedBox(
                          height: AppLayout.getHeight(20), width: AppLayout.getWidth(10),
                          child:  DecoratedBox(
                            decoration: BoxDecoration(
                          color: isColor==null? Colors.grey.shade200:Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(AppLayout.getHeight(10)),
                              bottomRight: Radius.circular(AppLayout.getHeight(10)))
                        ),),
                        ),
                        Expanded(child: Padding(
                          padding:  EdgeInsets.all(12),
                          child: LayoutBuilder(
                            builder: (BuildContext context , BoxConstraints constraints ) {
                              return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: isColor==null? Colors.white:Colors.grey.shade300
                                    ),
                                  ),
                                )),
                              );
                            },

                          ),
                        )),
                         SizedBox(
                          height: AppLayout.getHeight(20), width: AppLayout.getHeight(10),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: isColor==null? Colors.grey.shade200:Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(AppLayout.getHeight(10)),
                                    bottomLeft: Radius.circular(AppLayout.getHeight(10)))
                            ),),
                        )
                      ],
                    ),
                  ),
                  //bottom part of the orange card ticket
                  Container(
                    decoration:  BoxDecoration(
                        color: isColor==null? Colors.deepOrangeAccent:Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(isColor==null?21:0),
                            bottomRight: Radius.circular(isColor==null?21:0))
                    ),
                    padding: const EdgeInsets.only(left: 16,top: 10, right: 16, bottom: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppColumnLayout(firstText: ticket['date'], secondText: "Date", alignment: CrossAxisAlignment.start, isColor: isColor,),
                            AppColumnLayout(firstText: ticket['departure_time'], secondText: "Departure time", alignment: CrossAxisAlignment.center, isColor: isColor,),
                            AppColumnLayout(firstText: ticket['number'].toString(), secondText: "Number", alignment: CrossAxisAlignment.end, isColor: isColor,),


                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],),
        );
  }
}
