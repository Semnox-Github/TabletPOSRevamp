import 'package:execution_context/builder.dart';
import 'package:master_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_model.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_data.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/repos/repositories.dart';
import 'app_events.dart';
import 'app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';

List<FacilityTableCurrentStatusDTO>? facilityTableCurrentStatusDTO = [];

class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {

  Map<int, FacilityTableContainerDTO>? tableMap;

  _getCurrentStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!); //not required
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    facilityTableCurrentStatusDTO = await orderDataBL.getFacilityTableCurrentStatuses();
    Log.v("FacilityTableCurrentStatusDTO count ${facilityTableCurrentStatusDTO?.length}");
  }

  FacilityBloc() : super(FacilityLoadingState()){
    on<LoadFacilityEvent>((event, emit) async {
      emit(FacilityLoadingState());
      try{
        final execContextBL = await ExecutionContextBuilder.build();
        final execContext = execContextBL.getExecutionContext();
        final masterDataBL = await MasterDataBuilder.build(execContext!);
        final orderDataBL = await OrdersDataBuilder.build(execContext);
        var posMachines = await  masterDataBL.getPosMachines();
        var posId = execContext.machineId!;
        var facilityIdList = [];
        posMachines?.forEach((element) {
          if(element.posMachineId == posId){
            print("Current POS ${element.facilityIdList}");
            facilityIdList = element.facilityIdList;
          }
        });

        final facilityList = <FacilityContainerDTO>[];
        final facilityListFinal = <FacilityContainerDTO>[];

        final facilties = await masterDataBL.getFacilities();
        final tableStatuses = await orderDataBL.getFacilityTableCurrentStatuses();

        var firstList = List<int>.generate((facilties?.length ?? 0), (i) => facilties?[i].facilityId ?? 0);
        var thirdList = firstList.toSet().intersection(facilityIdList.toSet()).toList();
        var filtered = facilties?.where((e) => thirdList.contains(e.facilityId)).toList();
        //setState(() {
        facilityList.addAll(filtered as Iterable<FacilityContainerDTO>);

        if(tableMap == null) {
          tableMap = <int, FacilityTableContainerDTO>{};
          facilityList?.forEach((element) {
            element.facilityTableContainerDTOList.forEach((table) {
              tableMap![table.tableId] = table;
            });
          });
        }

        facilityList?.forEach((element) {
          final facilityTableList = <FacilityTableContainerDTO>[];
          element.facilityTableContainerDTOList.forEach((table) {
            final status = tableStatuses?.where((item) => item.tableId == table.tableId);
            if(status?.isNotEmpty == true) {
              final currentTable = tableMap![table.tableId];
              final tableName = currentTable!.tableName;
              final mergedWithTableName = tableMap?[status?.first.mergedWithTableId]?.tableName;
              facilityTableList.add(table.copyWith(facilityTableCurrentStatusDTO: status?.first.copyWith(
                tableName: tableName,
                mergedWithTableIdName: mergedWithTableName,
              )));
            }
          });
          facilityListFinal.add(element.copyWith(facilityTableContainerDTOList: facilityTableList));
        });
        _getCurrentStatuses();
        emit(FacilityLoadedState(facilityListFinal));
      } catch (e) {
        emit(FacilityLoadingErrorState(e.toString()));
      }
    });
  }
}