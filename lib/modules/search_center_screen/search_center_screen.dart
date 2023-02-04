import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/modules/center_profile_screen/center_profile_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class SearchCenterScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyBroken.arrowLeft2),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                defaultTextFormField(
                  validate: (value){},
                  text: 'Search',
                  controller: searchController,
                  inputType: TextInputType.text,
                  prefix: IconlyBroken.search,
                  onChange: (value) {},
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => centersItem(context),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget centersItem(context) => Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: (){
            // navigateTo(context, CenterProfileScreen());
          },
          child: Column(
            children: [
              Card(
                shadowColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Container(
                  width: 140,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        'https://www.clipartmax.com/png/full/144-1441189_logo-for-web-design-corporate-identity-design-sydney-creative-design-logo-png.png',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Center one',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: (){
            // navigateTo(context, CenterProfileScreen());
          },
          child: Column(
            children: [
              Card(
                shadowColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Container(
                  width: 140,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        'https://www.clipartmax.com/png/full/144-1441189_logo-for-web-design-corporate-identity-design-sydney-creative-design-logo-png.png',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Center one',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),

    ],
  );
}

