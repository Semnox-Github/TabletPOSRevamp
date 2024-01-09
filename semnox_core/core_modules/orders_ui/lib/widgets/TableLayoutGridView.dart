// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:orders_data/models/facility_container/facility_container_dto.dart';
// import 'package:orders_ui/utils/AppColors.dart';
// import 'package:orders_data/blocs/app_blocs.dart';
// import 'package:orders_data/blocs/app_events.dart';
// import 'package:orders_data/blocs/app_states.dart';
// import 'package:orders_data/models/facility_model.dart';
// import 'package:orders_data/repos/repositories.dart';
// import 'package:logs_data/logger.dart';
//
// class TableLayoutGridView extends StatefulWidget {
//   TableLayoutGridView({
//     Key? key,
//     required this.callBackIndex,
//   }) : super(key: key);
//   int callBackIndex;
//
//   @override
//   State<TableLayoutGridView> createState() => _TableLayoutGridViewState();
// }
//
// class _TableLayoutGridViewState extends State<TableLayoutGridView> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Log.v("callBackIndex received : "+widget.callBackIndex.toString());
//   }
//
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
//             return Container(
//               width: double.infinity,
//               height: 600,
//               color: Colors.white,
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(100.0),
//                   child: GridView.builder(
//                     itemCount: facilitiesList[widget.callBackIndex].facilityTableContainerDTOList.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 12),
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: new Container(
//                           width: 30,height: 30,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             color: AppColors.tableGreen,
//                           ),
//                           child: Stack(
//                             children: [
//                               Center(
//                                 child: Text(facilitiesList[widget.callBackIndex].facilityTableContainerDTOList[index].tableName,
//                                   style: GoogleFonts.robotoCondensed(
//                                       color: Colors.white,
//                                       fontSize: 14.0,
//                                       fontStyle: FontStyle.normal,
//                                       fontWeight: FontWeight.w600
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5, right: 5),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text("F",
//                                     style: GoogleFonts.robotoCondensed(
//                                       color: Colors.white,
//                                       fontSize: 14.0,
//                                       fontStyle: FontStyle.normal,
//
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             );
//           }
//           return Container();
//         },
//       )
//     );
//   }
// }
//
// /*
// final List<int> numbers = List.generate(10, (index) => index);
//
// Row(
//   children: [
//     Column(
//       children: List.generate(numbers.length ~/ 2,
//           (index) => getContainer(numbers[index].toString())).toList(),
//     ),
//     Column(
//       children: List.generate(
//           numbers.length ~/ 2,
//           (index) => getContainer(
//               numbers[numbers.length ~/ 2 + index].toString())).toList(),
//     ),
//   ],
// );
//  */
//
