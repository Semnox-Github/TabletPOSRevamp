class AttendanceForDay {
  Data? data;

  AttendanceForDay({this.data});

  AttendanceForDay.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? attendanceId;
  int? userId;
  String? createdBy;
  String? startDate;
  int? workShiftScheduleId;
  String? workShiftStartTime;
  dynamic? hours;
  String? status;
  String? isActive;
  String? creationDate;
  String? lastUpdatedUser;
  String? lastUpdatedDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  dynamic? requestStatus;
  dynamic? userFirstName;
  dynamic? userLastName;
  dynamic? userEmpNum;
  dynamic? userLoginId;
  String? hourUpdatedTime;
  List<AttendanceLogDTOList>? attendanceLogDTOList;
  bool? isChanged;
  bool? isChangedRecursive;

  Data(
      {this.attendanceId,
      this.userId,
      this.createdBy,
      this.startDate,
      this.workShiftScheduleId,
      this.workShiftStartTime,
      this.hours,
      this.status,
      this.isActive,
      this.creationDate,
      this.lastUpdatedUser,
      this.lastUpdatedDate,
      this.siteId,
      this.masterEntityId,
      this.synchStatus,
      this.guid,
      this.requestStatus,
      this.userFirstName,
      this.userLastName,
      this.userEmpNum,
      this.userLoginId,
      this.hourUpdatedTime,
      this.attendanceLogDTOList,
      this.isChanged,
      this.isChangedRecursive});

  Data.fromJson(Map<String, dynamic> json) {
    attendanceId = json['AttendanceId'];
    userId = json['UserId'];
    createdBy = json['CreatedBy'];
    startDate = json['StartDate'];
    workShiftScheduleId = json['WorkShiftScheduleId'];
    workShiftStartTime = json['WorkShiftStartTime'];
    hours = json['Hours'];
    status = json['Status'];
    isActive = json['IsActive'];
    creationDate = json['CreationDate'];
    lastUpdatedUser = json['LastUpdatedUser'];
    lastUpdatedDate = json['LastUpdatedDate'];
    siteId = json['SiteId'];
    masterEntityId = json['MasterEntityId'];
    synchStatus = json['SynchStatus'];
    guid = json['Guid'];
    requestStatus = json['RequestStatus'];
    userFirstName = json['UserFirstName'];
    userLastName = json['UserLastName'];
    userEmpNum = json['UserEmpNum'];
    userLoginId = json['UserLoginId'];
    hourUpdatedTime = json['HourUpdatedTime'];
    if (json['AttendanceLogDTOList'] != null) {
      attendanceLogDTOList = <AttendanceLogDTOList>[];
      json['AttendanceLogDTOList'].forEach((v) {
        attendanceLogDTOList!.add(AttendanceLogDTOList.fromJson(v));
      });
    }
    isChanged = json['IsChanged'];
    isChangedRecursive = json['IsChangedRecursive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AttendanceId'] = attendanceId;
    data['UserId'] = userId;
    data['CreatedBy'] = createdBy;
    data['StartDate'] = startDate;
    data['WorkShiftScheduleId'] = workShiftScheduleId;
    data['WorkShiftStartTime'] = workShiftStartTime;
    data['Hours'] = hours;
    data['Status'] = status;
    data['IsActive'] = isActive;
    data['CreationDate'] = creationDate;
    data['LastUpdatedUser'] = lastUpdatedUser;
    data['LastUpdatedDate'] = lastUpdatedDate;
    data['SiteId'] = siteId;
    data['MasterEntityId'] = masterEntityId;
    data['SynchStatus'] = synchStatus;
    data['Guid'] = guid;
    data['RequestStatus'] = requestStatus;
    data['UserFirstName'] = userFirstName;
    data['UserLastName'] = userLastName;
    data['UserEmpNum'] = userEmpNum;
    data['UserLoginId'] = userLoginId;
    data['HourUpdatedTime'] = hourUpdatedTime;
    if (attendanceLogDTOList != null) {
      data['AttendanceLogDTOList'] =
          attendanceLogDTOList!.map((v) => v.toJson()).toList();
    }
    data['IsChanged'] = isChanged;
    data['IsChangedRecursive'] = isChangedRecursive;
    return data;
  }
}

class AttendanceLogDTOList {
  int? attendanceLogId;
  int? attendanceId;
  String? cardNumber;
  int? readerId;
  String? timestamp;
  String? type;
  String? mode;
  int? attendanceRoleId;
  int? attendanceRoleApproverId;
  String? status;
  int? machineId;
  int? pOSMachineId;
  dynamic? tipValue;
  String? isActive;
  String? creationDate;
  String? createdBy;
  String? lastUpdatedUser;
  String? lastUpdatedDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  int? originalAttendanceLogId;
  String? requestStatus;
  String? approvedBy;
  String? approvalDate;
  int? userId;
  String? remarks;
  String? notes;
  int? attendanceLogStatusId;
  int? attendanceLogRequestStatusId;
  bool? isChanged;

  AttendanceLogDTOList(
      {this.attendanceLogId,
      this.attendanceId,
      this.cardNumber,
      this.readerId,
      this.timestamp,
      this.type,
      this.mode,
      this.attendanceRoleId,
      this.attendanceRoleApproverId,
      this.status,
      this.machineId,
      this.pOSMachineId,
      this.tipValue,
      this.isActive,
      this.creationDate,
      this.createdBy,
      this.lastUpdatedUser,
      this.lastUpdatedDate,
      this.siteId,
      this.masterEntityId,
      this.synchStatus,
      this.guid,
      this.originalAttendanceLogId,
      this.requestStatus,
      this.approvedBy,
      this.approvalDate,
      this.userId,
      this.remarks,
      this.notes,
      this.attendanceLogStatusId,
      this.attendanceLogRequestStatusId,
      this.isChanged});

  AttendanceLogDTOList.fromJson(Map<String, dynamic> json) {
    attendanceLogId = json['AttendanceLogId'];
    attendanceId = json['AttendanceId'];
    cardNumber = json['CardNumber'];
    readerId = json['ReaderId'];
    timestamp = json['Timestamp'];
    type = json['Type'];
    mode = json['Mode'];
    attendanceRoleId = json['AttendanceRoleId'];
    attendanceRoleApproverId = json['AttendanceRoleApproverId'];
    status = json['Status'];
    machineId = json['MachineId'];
    pOSMachineId = json['POSMachineId'];
    tipValue = json['TipValue'];
    isActive = json['IsActive'];
    creationDate = json['CreationDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedUser = json['LastUpdatedUser'];
    lastUpdatedDate = json['LastUpdatedDate'];
    siteId = json['SiteId'];
    masterEntityId = json['MasterEntityId'];
    synchStatus = json['SynchStatus'];
    guid = json['Guid'];
    originalAttendanceLogId = json['OriginalAttendanceLogId'];
    requestStatus = json['RequestStatus'];
    approvedBy = json['ApprovedBy'];
    approvalDate = json['ApprovalDate'];
    userId = json['UserId'];
    remarks = json['Remarks'];
    notes = json['Notes'];
    attendanceLogStatusId = json['AttendanceLogStatusId'];
    attendanceLogRequestStatusId = json['AttendanceLogRequestStatusId'];
    isChanged = json['IsChanged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AttendanceLogId'] = attendanceLogId;
    data['AttendanceId'] = attendanceId;
    data['CardNumber'] = cardNumber;
    data['ReaderId'] = readerId;
    data['Timestamp'] = timestamp;
    data['Type'] = type;
    data['Mode'] = mode;
    data['AttendanceRoleId'] = attendanceRoleId;
    data['AttendanceRoleApproverId'] = attendanceRoleApproverId;
    data['Status'] = status;
    data['MachineId'] = machineId;
    data['POSMachineId'] = pOSMachineId;
    data['TipValue'] = tipValue;
    data['IsActive'] = isActive;
    data['CreationDate'] = creationDate;
    data['CreatedBy'] = createdBy;
    data['LastUpdatedUser'] = lastUpdatedUser;
    data['LastUpdatedDate'] = lastUpdatedDate;
    data['SiteId'] = siteId;
    data['MasterEntityId'] = masterEntityId;
    data['SynchStatus'] = synchStatus;
    data['Guid'] = guid;
    data['OriginalAttendanceLogId'] = originalAttendanceLogId;
    data['RequestStatus'] = requestStatus;
    data['ApprovedBy'] = approvedBy;
    data['ApprovalDate'] = approvalDate;
    data['UserId'] = userId;
    data['Remarks'] = remarks;
    data['Notes'] = notes;
    data['AttendanceLogStatusId'] = attendanceLogStatusId;
    data['AttendanceLogRequestStatusId'] = attendanceLogRequestStatusId;
    data['IsChanged'] = isChanged;
    return data;
  }
}
