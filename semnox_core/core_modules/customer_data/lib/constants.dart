
/// condition type
///
const AND = 'AND';
const OR = 'OR';

/// operators
///
const LIKE = 'LIKE';
const NOT_LIKE = 'NOT_LIKE';
const EQUAL_TO = 'EQUAL_TO';
const NOT_EQUAL_TO = 'NOT_EQUAL_TO';
const GREATER_THAN = 'GREATER_THAN';
const LESSER_THAN = 'LESSER_THAN';
const GREATER_THAN_OR_EQUAL_TO = 'GREATER_THAN_OR_EQUAL_TO';
const LESSER_THAN_OR_EQUAL_TO = 'LESSER_THAN_OR_EQUAL_TO';
const BETWEEN = 'BETWEEN';
const IN = 'IN';
const IS_NULL = 'IS_NULL';
const IS_NOT_NULL = 'IS_NOT_NULL';

/// Field names
///
const PROFILE_FIRST_NAME = 'Profile.FirstName';
const PROFILE_MIDDLE_NAME = 'Profile.MiddleName';
const PROFILE_LAST_NAME = 'Profile.LastName';
const PROFILE_UNIQUE_IDENTIFIER = 'Profile.UniqueId';
const PHONE_NO = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Contact.Attribute1))';
const EMAIL = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Contact.Attribute1))';
const CUSTOMER_SITE_ID = 'customers.site_id';
const CUSTOMER_MEMBERSHIP_ID = 'customers.MembershipId';

const CUSTOMER_ID = 'customers.customer_id';
const CUSTOMER_PROFILE_ID = 'customers.ProfileId';
const CUSTOMER_CHANNEL = 'customers.channel';
const CUSTOMER_EXTERNAL_SYSTEM_REFERENCE = 'customers.ExternalSystemRef';
const CUSTOMER_CUSTOM_DATA_SET_ID = 'customers.CustomDataSetId';
const CUSTOMER_VERIFIED = 'customers.Verified';
const CUSTOMER_CREATED_BY = 'customers.CreatedBy';
const CUSTOMER_CREATION_DATE = 'customers.CreationDate';
const CUSTOMER_LAST_UPDATED_BY = 'customers.last_updated_user';
const CUSTOMER_SIGNED_WAIVER_CHANNEL = 'CustomerSignedWaiverHeader.Channel';
const PROFILE_PROFILE_TYPE = 'ProfileType.Name';
const PROFILE_TITLE = 'Profile.Title';
const PROFILE_NOTES = 'Profile.Notes';
const PROFILE_DATE_OF_BIRTH = 'Profile.DateOfBirth';
const PROFILE_GENDER = 'Profile.Gender';
const PROFILE_ANNIVERSARY = 'CONVERT(DateTime,CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Profile.Anniversary)))';
const PROFILE_PHOTO_URL = 'Profile.PhotoURL';
const PROFILE_TAX_CODE = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Profile.TaxCode))';
const PROFILE_COMPANY = 'Profile.Company';
const PROFILE_DESIGNATION = 'Profile.Designation';
const PROFILE_USER_NAME = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Profile.Username))';
const PROFILE_USER_NAME_OR_EMAIL = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Profile.Username))';
const PROFILE_PASSWORD = 'Profile.Password';
const PROFILE_LAST_LOGIN_TIME = 'Profile.LastLoginTime';
const ADDRESS_ADDRESS_TYPE = 'AddressType.Name';
const ADDRESS_LINE1 = 'Address.Line1';
const ADDRESS_LINE2 = 'Address.Line2';
const ADDRESS_LINE3 = 'Address.Line3';
const ADDRESS_CITY = 'Address.City';
const ADDRESS_STATE_ID = 'Address.StateId';
const ADDRESS_COUNTRY_ID = 'Address.CountryId';
const ADDRESS_POSTAL_CODE = 'Address.PostalCode';
const CONTACT_CONTACT_TYPE = 'ContactType.Name';
const CONTACT_ATTRIBUTE1 = 'Contact.Attribute1';
const CONTACT_ATTRIBUTE2 = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Contact.Attribute2))';
const ISACTIVE = 'isnull(customers.isactive,\'1\')';
const CUSTOMER_GUID = 'customers.guid';
const PROFILE_EXTERNAL_SYSTEM_REFERENCE = 'Profile.ExternalSystemReference';
const CONTACT_IS_ACTIVE = 'isnull(Contact.IsActive,\'1\')';
const ADDRESS_IS_ACTIVE = 'isnull(Address.IsActive,\'1\')';
const CUSTOMER_ID_IN = 'customers.customer_id';
const CUSTOMER_LAST_UPDATE_FROM_DATE = 'customers.last_updated_date';
const CUSTOMER_LAST_UPDATE_TO_DATE = 'customers.last_updated_date';
const IS_ADULT = 'Profile.DateOfBirth';
const CUSTOMER_TYPE = 'customers.CustomerType';
const CONTACT_PHONE_OR_EMAIL = 'CONVERT(NVARCHAR(MAX),DECRYPTBYPASSPHRASE(@PassPhrase,Contact.Attribute1))';
const CUSTOM_DATA_NAME = 'cdv.Name';
const CUSTOM_DATA_VALUE = 'cdv.ValueChar';
