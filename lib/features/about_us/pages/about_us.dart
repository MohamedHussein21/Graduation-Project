import 'package:brain_tumor/core/utils/font_mange.dart';
import 'package:brain_tumor/core/utils/images_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/core/utils/validator.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_mange.dart';
import '../../forget_Password/widgets/default_appBar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> with Validations {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(text: ' About Us '),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.toPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(ImageAssets.aboutUs)),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              Text(
                '''  
The following terms and conditions, in addition to those laid out 
in the Website Privacy Policy apply to the Northwest Health - 
Starke ("the hospital", "we") Website. Please read these terms 
and conditions carefully each time you access this site or any 
of our other Websites, as the terms may change from time to 
time.
               ''',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, color: ColorManger.defaultColor),
              ),

              SizedBox(
                height: context.heigh * 0.03,
              ),
              Text(
                '''  
("the hospital Web site", "this Web Site") is an Internet-based 
online information and communication service provided by 
Northwest Health - Starke (“the hospital”, "we"). It is sometimes 
referred to in this Agreement as the Service. You agree to be 
bound by the terms and conditions of this Agreement, which 
includes the hospital's Website Privacy Policy linked to this 
Agreement. The hospital may modify this Agreement at any time. 
You agree to review thisAgreement periodically to ensure that 
you are aware of any modifications. Your continued access or use 
of the hospital Web site after the modifications have become 
effective shall be deemed as evidence of your acceptance of the 
modified Agreement.
               ''',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, color: ColorManger.defaultColor),
              ),

              SizedBox(
                height: context.heigh * 0.03,
              ),
              Text(
                '''  
We hereby grant you the right to view and use this Web site 
subject to the terms and conditionsof this Agreement. You may 
download and/or print a copy of information provided in this 
Web site for your personal use only. Permission to reprint or 
electronically reproduce any document or graphic in whole or 
in part for any other purpose is expressly prohibited, unless 
prior written consent is obtained from the respective 
copyright holder(s).
               ''',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, color: ColorManger.defaultColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
