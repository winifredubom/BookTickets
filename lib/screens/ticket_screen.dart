import 'package:barcode_widget/barcode_widget.dart';
import 'package:first_flutter_project/screens/ticket_view.dart';
import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:first_flutter_project/utils/app_styles.dart';
import 'package:first_flutter_project/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_info_list.dart';
import '../widgets/column_layout.dart';
import '../widgets/layout_builder_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [ ListView(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),
              vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(45)),
              Text("Tickets", style: Styles.headlineStyle1,),
            Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(5)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor: true,),
              ),
            const SizedBox(height: 1,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal:15, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  const [
                      AppColumnLayout(firstText: "Flutter DB",
                        secondText: "Passenger",
                        alignment: CrossAxisAlignment.start,
                      isColor: false),
                      AppColumnLayout(firstText: "5221 385085",
                          secondText: "Passport",
                          alignment: CrossAxisAlignment.end,
                          isColor: false),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(sections: 15, isColor: false,width: 5,),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  const [
                      AppColumnLayout(firstText: '0056 9395 604',
                          secondText: "Number of E-ticket",
                          alignment: CrossAxisAlignment.start,
                          isColor: false),
                      AppColumnLayout(firstText: "b94506",
                          secondText: "Booking code",
                          alignment: CrossAxisAlignment.end,
                          isColor: false),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(sections: 15, isColor: false,width: 5,),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/visa.png", scale: 11,),
                              Text(" *** 2395", style: Styles.headlineStyle3,)
                            ],
                          ),
                          Text('Payment method', style: Styles.headlineStyle4,)
                        ],
                      ),
                      const AppColumnLayout(firstText: "\$249.99",
                          secondText: "Price",
                          alignment: CrossAxisAlignment.end,
                          isColor: false),
                    ],
                  ),
                ],
              ),
            ),
            //Barcode
            const SizedBox(height: 1,),
            Container(
              decoration:  BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(21))
                )
              ),
              margin: EdgeInsets.only(left: AppLayout.getHeight(15), right:AppLayout.getHeight(15)) ,
              padding: EdgeInsets.only(top: AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(data: 'https://github.com/matrinovovo',
                    barcode: Barcode.code128(),
                  drawText: false,
                  color: Styles.textColor,
                  width: double.infinity,
                  height: 70,),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(ticket: ticketList[0], ),
            ),

          ],
        ),
          Positioned(
            left: AppLayout.getHeight(21),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor,
                width: 2)
              ),
              child: CircleAvatar(
            maxRadius: 4, 
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: AppLayout.getHeight(21),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor,
                      width: 2)
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          )
      ],
      ),
    );
  }
}
