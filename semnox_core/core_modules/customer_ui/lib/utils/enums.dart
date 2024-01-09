import 'package:customer_data/constants.dart' as constants;

enum FieldEnum {
  addressIsActive(constants.ADDRESS_IS_ACTIVE,'Address Is Active'),
  addressLineOne('CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase, Address.Line1))', 'Address Line 1'),
  addressLineTwo('CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase, Address.Line2))', 'Address Line 2'),
  addressLineThree('CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase, Address.Line3))', 'Address Line 3'),
  addressType(constants.ADDRESS_ADDRESS_TYPE,'Address Type'),
  anniversary(constants.PROFILE_ANNIVERSARY,'Anniversary'),
  city('Address.City', 'City'),
  company(constants.PROFILE_COMPANY, 'Company'),
  contact(constants.CONTACT_PHONE_OR_EMAIL, 'Contact'),
  contactAttribute2(constants.CONTACT_ATTRIBUTE2, 'Contact Attribute 2'),
  contactIsActive(constants.CONTACT_IS_ACTIVE, 'Contact Is Active'),
  contactType(constants.CONTACT_CONTACT_TYPE, 'Contact Type'),
  countryId('Address.CountryId', 'Country Id'),
  createdBy(constants.CUSTOMER_CREATED_BY, 'Created By'),
  creationDate(constants.CUSTOMER_CREATION_DATE, 'Creation Date'),
  customDataName(constants.CUSTOM_DATA_NAME, 'Custom Data Name'),
  customDataSetId(constants.CUSTOMER_CUSTOM_DATA_SET_ID, 'Custom Data Set Id'),
  customDataValue(constants.CUSTOM_DATA_VALUE, 'Custom Data Value'),
  customerChannel(constants.CUSTOMER_CHANNEL, 'Customer Channel'),
  customerExternalSystemReference(constants.CUSTOMER_EXTERNAL_SYSTEM_REFERENCE, 'Customer External System Reference'),
  guid('customers.guid', 'Customer Guid'),
  customerId('customers.customer_id', 'Customer Id'),
  customerSignedWaiverChannel(constants.CUSTOMER_SIGNED_WAIVER_CHANNEL, 'Customer Signed Waiver Channel'),
  dob('CONVERT(DateTime,CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Profile.DateOfBirth)))', 'Date of birth'),
  designation(constants.PROFILE_DESIGNATION, 'Designation'),
  firstName('Profile.FirstName', 'First Name'),
  gender('Profile.Gender', 'Gender'),
  isActive(constants.ISACTIVE, 'Is Active'),
  lastLoginTime(constants.PROFILE_LAST_LOGIN_TIME, 'Last Login Time'),
  lastName('Profile.LastName', 'Last Name'),
  lastUpdatedBy(constants.CUSTOMER_LAST_UPDATED_BY, 'Last Updated By'),
  lastUpdatedDate(constants.CUSTOMER_LAST_UPDATE_TO_DATE, 'Last Updated Date'),
  membershipId('customers.MembershipId', 'Membership Id'),
  middleName('Profile.MiddleName', 'Middle Name'),
  notes(constants.PROFILE_NOTES, 'Notes'),
  password(constants.PROFILE_PASSWORD, 'Password'),
  photoURL(constants.PROFILE_PHOTO_URL, 'Photo URL'),
  postalCode('Address.PostalCode', 'Postal Code'),
  profileExternalSystemReference(constants.PROFILE_EXTERNAL_SYSTEM_REFERENCE,'Profile External System Reference'),
  profileId('customers.ProfileId', 'Profile Id'),
  profileType(constants.PROFILE_PROFILE_TYPE, 'Profile Type'),
  siteId('customers.site_id', 'Site Id'),
  stateId('Address.StateId', 'State Id'),
  taxCode(constants.PROFILE_TAX_CODE, 'TAX Code'),
  title(constants.PROFILE_TITLE, 'Title '),
  type(constants.CUSTOMER_TYPE, 'Type'),
  uniqueId('CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Profile.UniqueId))', 'Unique Identifier'),
  userName(constants.PROFILE_USER_NAME, 'User Name'),
  userNameOrEmail(constants.PROFILE_USER_NAME, 'User Name Or Email'),
  verified(constants.CUSTOMER_VERIFIED, 'Verified');
  //phoneNo('CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Contact.Attribute1))', 'Phone Number'),
  //email('CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Contact.Attribute1))', 'Email');

  const FieldEnum(this.apiKey, this.name);

  final String apiKey;
  final String name;
}

enum OperatorEnum {
  like('LIKE', 'Contains'), /// same as 'Contains'
  notLike('NOT_LIKE', 'Doesn\'t Contains'), /// same as 'Doesnt Contains'
  equalTo('EQUAL_TO', 'Equal To'),
  notEqualTo('NOT_EQUAL_TO', 'Not Equal To'),
  greaterThan('GREATER_THAN', 'Greater Than'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO', 'Greater than or equal to'),
  lesserThan('LESSER_THAN', 'Lesser Than'),
  lesserThanOrEqualTo('LESSER_THAN_OR_EQUAL_TO', 'Lesser than or equal to'),
  between('BETWEEN', 'Between'),
  in_('IN', 'In'),
  isNull('IS_NULL', 'Is Null'),
  isNotNull('IS_NOT_NULL', 'Is Not Null');

  const OperatorEnum(this.apiKey, this.name);

  final String apiKey;
  final String name;
}

enum ValueEnum{
  number('Number'),
  text('Text'),
  dateTime('DateTime'),
  encryptedText('EncryptedText'),
  encryptedDateTime('EncryptedDateTime');

  const ValueEnum(this.type);

  final String type;
}

class EnumMapper {
  static final EnumMapper _instance = EnumMapper._internal();
  EnumMapper._internal();

  factory EnumMapper() {
    return _instance;
  }
  final operators = <OperatorEnum>[];
  ValueEnum keypadValue = ValueEnum.text;

  List<OperatorEnum> getMappedConditions(FieldEnum fieldEnum) {

    operators.clear();

    switch(fieldEnum) {
      case FieldEnum.addressIsActive:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.addressType:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.anniversary:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.company:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.contact:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.contactAttribute2:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.contactIsActive:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.contactType:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.createdBy:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.creationDate:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.customDataName:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.customDataSetId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.customDataValue:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.customerChannel:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.customerExternalSystemReference:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.designation:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.isActive:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.lastLoginTime:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.lastUpdatedBy:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.lastUpdatedDate:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
        ]);
        break;
      case FieldEnum.notes:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.password:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.photoURL:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.profileExternalSystemReference:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.profileType:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.taxCode:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.title:
        operators.addAll([
          OperatorEnum.like,
        ]);
        break;
      case FieldEnum.type:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.userName:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.userNameOrEmail:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.verified:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.firstName:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.middleName:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.lastName:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.uniqueId:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      /*case FieldEnum.phoneNo:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.email:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNotNull,
          OperatorEnum.isNull,
          OperatorEnum.equalTo,
        ]);
        break;*/
      case FieldEnum.siteId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.membershipId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.customerId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.customerSignedWaiverChannel:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.profileId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.gender:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.dob:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.addressLineOne:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.addressLineTwo:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.addressLineThree:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.city:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.stateId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.countryId:
        operators.addAll([
          OperatorEnum.equalTo,
          OperatorEnum.notEqualTo,
          OperatorEnum.greaterThan,
          OperatorEnum.greaterThanOrEqualTo,
          OperatorEnum.lesserThan,
          OperatorEnum.lesserThanOrEqualTo,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
        ]);
        break;
      case FieldEnum.postalCode:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
      case FieldEnum.guid:
        operators.addAll([
          OperatorEnum.like,
          OperatorEnum.notLike,
          OperatorEnum.isNull,
          OperatorEnum.isNotNull,
          OperatorEnum.equalTo,
        ]);
        break;
    }

    return operators;
  }

  ValueEnum getMappedValues(FieldEnum fieldEnum){
    switch(fieldEnum) {
      case FieldEnum.addressIsActive:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.addressType:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.anniversary:
        keypadValue = ValueEnum.encryptedDateTime;
        break;
      case FieldEnum.company:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.contact:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.contactAttribute2:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.contactIsActive:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.contactType:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.createdBy:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.creationDate:
        keypadValue = ValueEnum.dateTime;
        break;
      case FieldEnum.customDataName:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.customDataSetId:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.customDataValue:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.customerChannel:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.customerExternalSystemReference:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.designation:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.isActive:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.lastLoginTime:
        keypadValue = ValueEnum.dateTime;
        break;
      case FieldEnum.lastUpdatedBy:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.lastUpdatedDate:
        keypadValue = ValueEnum.dateTime;
        break;
      case FieldEnum.notes:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.password:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.photoURL:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.profileExternalSystemReference:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.profileType:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.taxCode:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.title:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.type:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.userName:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.firstName:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.middleName:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.lastName:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.uniqueId:
        keypadValue = ValueEnum.encryptedText;
        break;
    /*case FieldEnum.phoneNo:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.email:
         keypadValue = ValueEnum.number;
        break;*/
      case FieldEnum.siteId:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.membershipId:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.customerId:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.customerSignedWaiverChannel:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.profileId:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.gender:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.dob:
        keypadValue = ValueEnum.dateTime;
        break;
      case FieldEnum.addressLineOne:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.addressLineTwo:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.addressLineThree:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.city:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.stateId:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.countryId:
        keypadValue = ValueEnum.number;
        break;
      case FieldEnum.postalCode:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.guid:
        keypadValue = ValueEnum.text;
        break;
      case FieldEnum.userNameOrEmail:
        keypadValue = ValueEnum.encryptedText;
        break;
      case FieldEnum.verified:
        keypadValue = ValueEnum.text;
        break;
    }
    return keypadValue;
  }
}