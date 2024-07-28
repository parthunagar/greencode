import 'package:flutter/material.dart';

// English Translations

const Map<String, String> enUS = {
  //Common
  'data_not_found': 'Data Not Found',
  'submit': 'Submit',
  'description': 'Description',

  //Milestone 1
  //Sign In
  'email': 'Email',
  'resident_id': 'Resident Id',
  'password': 'PASSWORD',
  'login': 'LOGIN',
  'enter_email_password': 'Enter password',
  'enter_email': 'Please enter the email',
  'valid_email': 'Please enter valid email',
  'enter_password': 'Please enter the password',
  'valid_password': 'Password must be more then 6 character',
  'enter_resident_id': "Please enter the resident id",
  'forgot_password': 'Forgot Password?',

  //Forgot Password
  'forgot_password_title': 'Forgot Password ?',
  'email_address': 'EMAIL ADDRESS',
  'enter_email_forgot': 'Enter Email',
  'verify_code': 'Verify Code',
  'verification_code': 'Verification Code',
  'enter_verification_code': 'Enter Pass Code',

  //OTP Verification
  'valid_otp': 'Please enter valid OTP',
  'enter_verify_code': 'ENTER VERIFY CODE',
  'confirm': 'Confirm',
  'otp_span1': "CAN'T RECEIVE THE VERIFICATION CODE? ",
  'resend': 'RESEND',

  //Reset Password
  'reset_password': 'Reset Password',
  'enter_new_password': 'ENTER NEW PASSWORD',
  'reconfirm_password': 'RECONFIRM PASSWORD',
  'enter_reconfirm_password': 'ENTER RECONFIRM PASSWORD',
  'please_enter_new_password': 'Please enter the new password',
  'please_enter_new_valid_password':
      'New Password must be more then 6 character',
  'please_enter_reconfim_password': 'Please enter the reconfirm password',
  'please_enter_reconfirm_valid_password':
      'Reconfirm Password must be more then 6 character',
  'password_not_match': "New Password and Reconfirm password doesn't match",

  //Milestone 2
  //Home
  'main_page': 'Main Page',
  'qr_code': 'Qr Code',
  'booking': 'Booking',
  'notification': 'Notification',
  'estate_info_home': 'Estate Info',
  'booking_home': 'Booking',
  'easy_living_home': 'Easy Living',
  'my_account_home': 'My Account',
  'e_resident_card_home': 'eResident Card',
  'notification_home': 'Notification',
  'observatory_home': 'Hong Kong Observatory',

  //Estate Info List
  'estate_info_title': 'Estate Info',

  //Estate Fund Type List
  'estate_fund_type_title': 'Estate Notice',

  //Milestone 3
  //Booking
  "reservation_record": 'Reservation Record',

  //Reservation
  'pending': 'Pending',
  'past_records': 'Past Records',
  "reservation": 'Reservation',

  //Cancel Booking Dialog
  "cancel_booking_title": 'Are you Cancel the Booking?',
  "date_display_dialog": 'Selected Date',
  "time_display_dialog": 'Selected Time Period',
  "person_display_dialog": 'Number of Users',
  "back_dialog": 'Back',
  "cancel_dialog": 'Cancel',
  "booking_cancel": 'The Booking has been Cancelled',
  "past_records_completed": 'Completed',
  "past_records_cancelled": 'Cancelled',
  "past_records_overdue_payments": 'Overdue Payments',
  "pay_before": 'Please pay before',
  "cancelled": 'Cancelled',

  //Milestone 4
  //Booking Details
  "select_date": 'SELECT DATE',
  "select_time": 'SELECT TIME',
  "select_pax": 'PAX',
  "select_date_valid": 'SELECTED DATE',
  "select_time_valid": 'SELECTED PERIOD',
  "select_pax_valid": 'PAX',
  "usage_details": 'USAGE DETAILS',
  "per_session_topic": 'Per Session',
  "days": 'Days',
  "opening_hours": 'Opening Hours',
  "charge": 'Charge',
  "reserve": 'Reserve',
  "select": 'Select',
  "adult": 'Adult',
  "children": 'Children',
  "please_check_your_booking_info": 'Please check your booking info',
  "please_pay": 'Please pay by',
  "please_confirm": 'after confirming your reservation.',
  "baby": 'Baby',
  "babyMain": '(Below 3 years old)',
  "booked_successfully": 'Booked Successfully',
  "pay_by_date": 'Please pay by the Specified Date',
  "select_date_validation": 'Please Select Date',
  "select_time_validation": 'Please select time',
  "select_person_validation": 'Please select person',
  "select_adult_validation": 'Atleast one adult person will be required',
  "time_not_available":
      'Booking is not available for this date, Please select another date',

  //Milestone 5
  //Easy Living Info
  'easy_living_title': 'Easy Living',
  'interchange': 'Interchange',
  'service_hours': 'Service Hours',
  'call_us': 'Call Us',
  'maintenance_day': 'Maintenance Day',

  //Milestone 6
  'password_changed': 'Password Changed',
  'change_password': 'Change Password',
  'confirm_new_password': 'Confirm New Password',
  'please_enter_the_confirm_password': 'Please enter the confirm password',
  'confirm_Password_validation':
      'Confirm Password must be more then 6 character',
  'password_same': 'The password and confirm password must be same',
  'setting': 'Setting',
  'settings': 'Settings',
  'push_notification': 'Push Notification',
  'off': 'off',
  'on': 'on',
  'change_language': '切換語言/Change Language',
  'english': 'English',
  'clear_cached_data': 'Clear Cached Data',
  'clear_cache_data_val': '12.3M',
  'about': 'About',
  'version': 'Version',
  'version_val': '3.0.0',
  'disclaimer_privacy_policy': 'Disclaimer & Privacy Policy',
  'feedback': 'Feedback',
  'about_cic': 'About CIC',
  'rating_reviews': 'Rating & Reviews',
  'ereseident_card': 'eReseident Card',
  'logOut': 'LogOut',
  'logOut_successfully': 'LogOut Successfully',

  //Milestone 8
  'contact_us': 'Contact Us',
  'green_code_management_title': 'Green Code Management Office',
  'app_technical_title': 'App Technical Support : CardApp Limited',
  'edit': 'Edit',
  'done': 'Done',
  'notification_title': 'Notification Center',
  'system': 'System',
  'read': 'Read',
  'delete': 'Delete',
  'confirmed_to_delete': 'Confirmed to Delete?',

  //Milestone 9
  'eresident_card': 'eResident Card',
  'you_cannot_scan_your_own_qr_code': "You can't scan your own QR code.",
  'first_name': 'First Name',
  'last_name': 'Last Name',
  'mobile_no': 'Mobile No.',
  'address': 'Address',
  'user_number': 'User Number',
  'qr_hint': 'Put the QR code in the box\nto scan it automatically',

  'flat_number_code': 'Flat Number Code',
  'resident_name': 'Resident Type',
  'club_maintanace_toast':
      'The club is in maintenance for the selected time, please check later.',

  //New

  'forgot_id': 'Forgot ID?',
  'pass_code': 'PASS CODE',
  'resident_id_upper': 'RESIDENT ID',
  'password_upper': 'PASSWORD',
  'sign_up': 'Sign Up',
  'sign_in': 'Sign In',
  'send_new_pass_code': 'Send a new Pass Code',

  'forgot_your_id': 'Forgot Your ID?',
  'forgot_id_content' : 'If you have forgotten your Resident ID, please contact the Management Office during office hours.',
  'pass_code_sent': 'Pass Code Sent',
  'pass_code_content': 'A new Pass Code was sent to your email. Please use the Pass Code to reset your password.If you do not receive the Pass Code, please check your spam folder or contact Management Office.',

  'monday' : 'Monday',
  'tuesday' : 'Tuesday',
  'wednesday' : 'Wednesday',
  'thursday' : 'Thursday',
  'friday' : 'Friday',
  'saturday' : 'Saturday',
  'sunday' : 'Sunday',

  'paid' : 'Paid',

  'label1':'KMB',
  'label2':'Citybus',
  'label3':'NWFB',
  'label4':'Transportation Dept',

  'call_now':'Make a call now:',
  'visit_website':'Visit website:'

};
