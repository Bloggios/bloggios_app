/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: exception_details
 */

import 'dart:collection';

import 'package:bloggios_app/core/models/exception_info.dart';

class ExceptionCodeService {

  final HashMap<String, ExceptionInfo> _exceptionDetails = HashMap();

  ExceptionCodeService() {
    _initializeExceptionCodes();
  }

  ExceptionInfo? getExceptionInfo(String key) {
    return _exceptionDetails[key];
  }

  void _initializeExceptionCodes() {

    _exceptionDetails['AUTH--1001'] = const ExceptionInfo(
        'AUTH--1001', 'AUTH--1001', 'User not found with the given User Id');
    _exceptionDetails['AUTH--1002'] = const ExceptionInfo(
        'AUTH--1002', 'AUTH--1002', 'User not found with the given Email');
    _exceptionDetails['AUTH--1003'] = const ExceptionInfo('AUTH--1003',
        'AUTH--1003', 'User is already registered with given Email');
    _exceptionDetails['AUTH--1004'] = const ExceptionInfo(
        'AUTH--1004', 'AUTH--1004', 'Role not found with the given Role Id');
    _exceptionDetails['AUTH--1005'] = const ExceptionInfo(
        'AUTH--1005', 'AUTH--1005', 'Unable to create username');
    _exceptionDetails['AUTH--1006'] = const ExceptionInfo(
        'AUTH--1006', 'AUTH--1006', 'User not found with the given data');
    _exceptionDetails['AUTH--1007'] =
    const ExceptionInfo('AUTH--1007', 'Incorrect Password', 'Password you entered is incorrect. Please try again or use forgot password');
    _exceptionDetails['AUTH--1008'] =
    const ExceptionInfo('AUTH--1008', 'AUTH--1008', 'User is not enabled');
    _exceptionDetails['AUTH--1009'] =
    const ExceptionInfo('AUTH--1009', 'AUTH--1009', 'User account is locked');
    _exceptionDetails['AUTH--1010'] = const ExceptionInfo(
        'AUTH--1010', 'AUTH--1010', 'User not found with the given Email');
    _exceptionDetails['AUTH--1011'] = const ExceptionInfo(
        'AUTH--1011', 'AUTH--1011', 'User not found with the given Username');
    _exceptionDetails['AUTH--1012'] = const ExceptionInfo('AUTH--1012',
        'AUTH--1012', 'User not found with the given Mobile Number');
    _exceptionDetails['AUTH--1013'] = const ExceptionInfo(
        'AUTH--1013', 'AUTH--1013', 'Client not found with the given Client Id');
    _exceptionDetails['AUTH--1014'] =
    const ExceptionInfo('AUTH--1014', 'AUTH--1014', 'Client Id is invalid');
    _exceptionDetails['AUTH--1015'] = const ExceptionInfo(
        'AUTH--1015', 'AUTH--1015', 'Client credentials are expired');
    _exceptionDetails['AUTH--1016'] = const ExceptionInfo(
        'AUTH--1016', 'AUTH--1016', 'Client secret is invalid');
    _exceptionDetails['AUTH--1017'] = const ExceptionInfo(
        'AUTH--1017', 'AUTH--1017', 'Client status is not active');
    _exceptionDetails['AUTH--1018'] = const ExceptionInfo(
        'AUTH--1018', 'AUTH--1018', 'Client Id is not present in the request');
    _exceptionDetails['AUTH--1019'] = const ExceptionInfo('AUTH--1019',
        'AUTH--1019', 'Client secret is not present in the request');
    _exceptionDetails['AUTH--1020'] = const ExceptionInfo(
        'AUTH--1020', 'AUTH--1020', 'Password is not present in the request');
    _exceptionDetails['AUTH--1021'] = const ExceptionInfo(
        'AUTH--1021',
        'AUTH--1021',
        'Please enter a valid email or username or mobile number to continue');
    _exceptionDetails['AUTH--1022'] =
    const ExceptionInfo('AUTH--1022', 'AUTH--1022', 'Email is not valid');
    _exceptionDetails['AUTH--1023'] = const ExceptionInfo(
        'AUTH--1023',
        'AUTH--1023',
        'Username should be of 4 characters, starts with alphabets, can contains numbers in between and special characters (-, _)');
    _exceptionDetails['AUTH--1024'] = const ExceptionInfo(
        'AUTH--1024', 'AUTH--1024', 'Mobile number is not valid');
    _exceptionDetails['AUTH--1025'] = const ExceptionInfo(
        'AUTH--1025', 'AUTH--1025', 'Not authorized to access the application');
    _exceptionDetails['AUTH--1026'] =
    const ExceptionInfo('AUTH--1026', 'AUTH--1026', 'JWT Token is expired');
    _exceptionDetails['AUTH--1027'] =
    const ExceptionInfo('AUTH--1027', 'AUTH--1027', 'JWT token is malformed');
    _exceptionDetails['AUTH--1028'] = const ExceptionInfo('AUTH--1028',
        'AUTH--1028', 'Refresh token is not allowed for accessing the resources');
    _exceptionDetails['AUTH--1029'] = const ExceptionInfo(
        'AUTH--1029', 'AUTH--1029', 'Output stream is already shown');
    _exceptionDetails['AUTH--1030'] = const ExceptionInfo('AUTH--1030',
        'AUTH--1030', 'User Authentication is required to access this resource');
    _exceptionDetails['AUTH--1031'] = const ExceptionInfo(
        'AUTH--1031', 'AUTH--1031', 'Remote address authentication failed');
    _exceptionDetails['AUTH--1032'] = const ExceptionInfo(
        'AUTH--1032', 'AUTH--1032', 'Roles processor error occurred');
    _exceptionDetails['AUTH--1033'] =
    const ExceptionInfo('AUTH--1033', 'AUTH--1033', 'User id is invalid');
    _exceptionDetails['AUTH--1034'] = const ExceptionInfo('AUTH--1034',
        'AUTH--1034', 'User is not present in the given OTP Request');
    _exceptionDetails['AUTH--1035'] =
    const ExceptionInfo('AUTH--1035', 'AUTH--1035', 'Invalid OTP');
    _exceptionDetails['AUTH--1036'] = const ExceptionInfo(
        'AUTH--1036', 'AUTH--1036', 'User is already enabled');
    _exceptionDetails['AUTH--1037'] = const ExceptionInfo('AUTH--1037',
        'AUTH--1037', 'OTP is expired. Please resend OTP to generate const OTP');
    _exceptionDetails['AUTH--1038'] = const ExceptionInfo(
        'AUTH--1038', 'AUTH--1038', 'Internal error occurred at backend');
    _exceptionDetails['AUTH--1039'] = const ExceptionInfo(
        'AUTH--1039', 'AUTH--1039', 'Password format is incorrect');
    _exceptionDetails['AUTH--1040'] =
    const ExceptionInfo('AUTH--1040', 'AUTH--1040', 'User not logged in');
    _exceptionDetails['AUTH--1041'] = const ExceptionInfo(
        'AUTH--1041',
        'AUTH--1041',
        'Refresh token exception Occurred. Please reach out to support');
    _exceptionDetails['AUTH--1042'] = const ExceptionInfo('AUTH--1042',
        'AUTH--1042', 'Access token is not present in request header');
    _exceptionDetails['AUTH--1043'] = const ExceptionInfo(
        'AUTH--1043', 'AUTH--1043', 'Refresh token in invalid');
    _exceptionDetails['AUTH--1044'] = const ExceptionInfo(
        'AUTH--1044', 'AUTH--1044', 'Access token is invalid');
    _exceptionDetails['AUTH--1045'] = const ExceptionInfo(
        'AUTH--1045', 'AUTH--1045', 'Refresh token is expired');
    _exceptionDetails['AUTH--1046'] = const ExceptionInfo(
        'AUTH--1046', 'AUTH--1046', 'Invalid value for Religion');
    _exceptionDetails['AUTH--1047'] = const ExceptionInfo(
        'AUTH--1047', 'AUTH--1047', 'Invalid value for Gender');
    _exceptionDetails['AUTH--1048'] = const ExceptionInfo(
        'AUTH--1048', 'AUTH--1048', 'Invalid value for Country');
    _exceptionDetails['AUTH--1049'] = const ExceptionInfo('AUTH--1049',
        'AUTH--1049', 'Name is mandatory and cannot be null or empty');
    _exceptionDetails['AUTH--1050'] =
    const ExceptionInfo('AUTH--1050', 'AUTH--1050', 'Name is too long');
    _exceptionDetails['AUTH--1051'] =
    const ExceptionInfo('AUTH--1051', 'AUTH--1051', 'Profile already exists');
    _exceptionDetails['AUTH--1052'] =
    const ExceptionInfo('AUTH--1052', 'AUTH--1052', 'Incorrect date');
    _exceptionDetails['AUTH--1053'] = const ExceptionInfo(
        'AUTH--1053', 'AUTH--1053', 'Date of Birth is not valid');
    _exceptionDetails['AUTH--1054'] = const ExceptionInfo(
        'AUTH--1054', 'AUTH--1054', 'Invalid value for Education Level');
    _exceptionDetails['AUTH--1055'] = const ExceptionInfo(
        'AUTH--1055', 'AUTH--1055', 'Invalid value for Zodiac Sign');
    _exceptionDetails['AUTH--1056'] = const ExceptionInfo(
        'AUTH--1056', 'AUTH--1056', 'Invalid value for Marital Status');
    _exceptionDetails['AUTH--1057'] = const ExceptionInfo(
        'AUTH--1057', 'AUTH--1057', 'Invalid value for Family Type');
    _exceptionDetails['AUTH--1058'] = const ExceptionInfo(
        'AUTH--1058', 'AUTH--1058', 'Invalid value for Occupation Status');
    _exceptionDetails['AUTH--1059'] =
    const ExceptionInfo('AUTH--1059', 'AUTH--1059', 'User is not logged in');
    _exceptionDetails['AUTH--1060'] = const ExceptionInfo(
        'AUTH--1060', 'AUTH--1060', 'Profile is required to init Matrimony');
    _exceptionDetails['SOCKET_EXCEPTION'] = const ExceptionInfo(
        'SOCKET_EXCEPTION', 'Server Unavailable', 'Backend Servers are currently under maintenance or unavailable.');
  }
}
