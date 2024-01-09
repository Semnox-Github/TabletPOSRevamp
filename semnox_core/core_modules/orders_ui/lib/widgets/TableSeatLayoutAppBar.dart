// import 'package:execution_context/builder.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:orders_data/blocs/app_blocs.dart';
// import 'package:orders_data/blocs/app_events.dart';
// import 'package:orders_data/blocs/app_states.dart';
// import 'package:orders_data/models/facility_container/facility_container_dto.dart';
// import 'package:orders_data/models/facility_model.dart';
// import 'package:orders_data/repos/repositories.dart';
// import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
// import 'package:orders_ui/utils/AppColors.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:orders_ui/widgets/StatusInfoDialog.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:logs_data/logger.dart';
//
// class TableSeatLayoutAppBar extends StatefulWidget {
//   const TableSeatLayoutAppBar({Key? key}) : super(key: key);
//
//   @override
//   State<TableSeatLayoutAppBar> createState() => _TableSeatLayoutAppBarState();
// }
//
// class _TableSeatLayoutAppBarState extends State<TableSeatLayoutAppBar> {
//   final ScrollController _controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FacilityBloc(
//         RepositoryProvider.of<FacilityRepository>(context),
//       )..add(LoadFacilityEvent()),
//       child: BlocBuilder<FacilityBloc, FacilityState>(
//         builder: (context, state){
//           if(state is FacilityLoadingState){
//             return const Center(child: CircularProgressIndicator());
//           }
//           if(state is FacilityLoadedState){
//             Log.v(state.facilities);
//             List<FacilityContainerDTO> facilitiesList = state.facilities;
//             return SizedBox(
//               height: 100,
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, bottom: 15),
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     const SizedBox(width: 10,),
//                     InkWell(
//                       onTap: (){
//                         _controller.animateTo(
//                           _controller.position.minScrollExtent,
//                           duration: Duration(seconds: 2),
//                           curve: Curves.fastOutSlowIn,
//                         );
//                       },
//                       child: Center(
//                         child: Stack(
//                           children: [
//                             Icon(Icons.arrow_back_ios_new,color: AppColors.buttonShadowColor,size: 35,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 15),
//                               child: Icon(Icons.arrow_back_ios_new,color: AppColors.buttonShadowColor,size: 35,),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     Container(
//                       height: 80, width: MediaQuery.of(context).size.width/1.6,
//                       child: ListView.builder(
//                         controller: _controller,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: facilitiesList.length,
//                         itemBuilder: (context, i){
//                             return Padding(
//                               padding: const EdgeInsets.only(right: 20),
//                               child: GestureDetector(
//                                 onTap: () async {
//                                   //final prefs = await SharedPreferences.getInstance();
//
//                                   Log.v(facilitiesList[i].facilityTableContainerDTOList.length);
//                                   setState(() {
//                                     selectedFacilityIndex = i;
//                                   });
//                                   Log.v(selectedFacilityIndex);
//
//                                   //prefs.setInt('callBackIndex', selectedFacilityIndex);
//                                 },
//                                 child: Container(
//                                   width: 180,
//                                   height: 60,
//                                   decoration: BoxDecoration(
//                                       color: selectedFacilityIndex == i ? AppColors.blackColor : Colors.grey.shade300,
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(facilitiesList[i].facilityName,
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.robotoCondensed(
//                                             color: selectedFacilityIndex == i ? AppColors.primaryColor : Colors.black,
//                                             fontSize: 18,fontWeight: FontWeight.w600
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                         },
//                       ),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         _controller.animateTo(
//                           _controller.position.maxScrollExtent,
//                           duration: Duration(seconds: 2),
//                           curve: Curves.fastOutSlowIn,
//                         );
//                       },
//                       child: Center(
//                         child: Stack(
//                           children: [
//                             Icon(Icons.arrow_forward_ios,color: AppColors.buttonShadowColor,size: 35,),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 15),
//                               child: Icon(Icons.arrow_forward_ios,color: AppColors.buttonShadowColor,size: 35,),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 20,),
//                     InkWell(
//                         onTap: (){
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return StatusInfoDialog();
//                             },
//                           );
//                         },
//                         child: Icon(Icons.info_outline,color: AppColors.blackColor,size: 35,)),
//                     const SizedBox(width: 20,),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
//
// }
//
//
