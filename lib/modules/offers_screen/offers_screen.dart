import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:talaky_app/data/models/offer_model.dart';
import 'package:talaky_app/modules/name_offer_screen/name_offer_screen.dart';
import 'package:talaky_app/modules/offers_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/offers_screen/cubit/states.dart';
import 'package:talaky_app/modules/search_offers_screen/search_offers_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class OffersScreen extends StatelessWidget {
  final scrollController = ScrollController();
  void setUpScrollController(context) {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
      {
        if(scrollController.position.pixels != 0 )
        {
          BlocProvider.of<OfferCubit>(context).loadOffer();
        }
      }
    });
  }
   OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setUpScrollController(context);
    BlocProvider.of<OfferCubit>(context).loadOffer();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyBroken.arrowLeft2),
        ),
        actions: [IconButton(
          onPressed:()
          {
            navigateTo(context, SearchOffersScreen());
          },
          icon: const Icon(IconlyBroken.search),
        )],
      ),
      body :buildNotConnectedScreen(screen:  offerBuild()) ,
    );
  }

  Widget offerBuild() {

    return BlocBuilder<OfferCubit, OfferStates>(
      builder: (context, state) {
        if (state is OfferLoadingState && state.isFirstFetch) {
          return loadingIndicator();
        }
        List<OfferData> offer = [];
        bool isLoading = false ;

        if (state is OfferLoadingState) {
          offer = state.oldOffer;
          isLoading = true ;
        } else if (state is OfferLoadedState) {
          offer = state.offer;
        }
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if(index < offer.length) {
              return dealsItem(offer[index], context);
            }else {
              Timer(const Duration(milliseconds: 30), ()
              {
                scrollController.jumpTo(
                    scrollController.position.maxScrollExtent
                );
              });

              return loadingIndicator();
            }

          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black12,
            );
          },
          itemCount: offer.length + (isLoading ? 1 : 0),
        );
      },
    );
  }

  Widget loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
  Widget dealsItem(  OfferData data , BuildContext context ) => InkWell(
    onTap: ()
    {
      navigateTo(context,   NameOfferScreen(id: data.id!,));
    },
    child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Stack(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${data.image}',
                    ),
                  ),
                ),
              ),
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    '${data.user!.logo}',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  '${data.user!.name} ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),),
                              child: Center(
                                child: Text(
                                  '${data.discount} EG',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(DateFormat('dd MMMM').format(DateTime.parse(data.startAt.toString())),
                                style: const TextStyle(color:Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text('To',
                                  style: TextStyle(color:Colors.white),),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text( DateFormat('dd MMMM').format(DateTime.parse(data.endAt.toString())),
                                  style: const TextStyle(color:Colors.white),),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
