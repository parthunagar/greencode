import 'package:flutter/material.dart';

// Chinese Translations
const Map<String, String> zhTW = {
//Common
  'data_not_found': '未找到數據',
  'submit': '提交',
  'description': '描述',

//Milestone 1
//Sign In
  'email': '電郵',
  'resident_id': '住戶編號',
  'password': '密碼',
  'login': '登入',
  'enter_email_password': '輸入密碼',
  'enter_email': '輸入電郵地址',
  'valid_email': '輸入有效電郵',
  'enter_password': '輸入密碼',
  'valid_password': '密碼必須多於 6 個字符',
  'enter_resident_id': "請輸入住戶身份號",
  'forgot_password': '忘記密碼?',

//Forgot Password
  'forgot_password_title': '忘記密碼?',
  'email_address': '電郵',
  'enter_email_forgot': '輸入電郵地址',
  'verify_code': '驗證碼',
  'verification_code': '驗證碼',
  'enter_verification_code': '輸入密碼',

//OTP Verification
  'valid_otp': '請輸入有效的一次性密碼',
  'enter_verify_code': '輸入驗證碼',
  'confirm': '確認',
  'otp_span1': "收不到驗證碼? ",
  'resend': '重發',

//Reset Password
  'reset_password': '重設密碼',
  'enter_new_password': '輸入新密碼',
  'reconfirm_password': '確認密碼',
  'enter_reconfirm_password': '輸入確認密碼',
  'please_enter_new_password': '請輸入新密碼',
  'please_enter_new_valid_password': '新密碼必須多於 6 個字符',
  'please_enter_reconfim_password': '請輸入重新確認密碼',
  'please_enter_reconfirm_valid_password': '確認密碼必須超過 6 個字符',
  'password_not_match': "新密碼和確認密碼不符合",

//Milestone 2
//Home
  'main_page': '主頁',
  'qr_code': '二維碼',
  'booking': '預訂',
  'notification': '通知',
  'estate_info_home': '屋苑通告',
  'booking_home': '預訂',
  'easy_living_home': '生活必備',
  'my_account_home': '我的帳號',
  'e_resident_card_home': '電子住戶證',
  'notification_home': '通知',
  'observatory_home': '香港天文台',

//Estate Info List
  'estate_info_title': '屋苑通告',

//Estate Fund Type List
  'estate_fund_type_title': '屋苑通告',

//Milestone 3
//Booking
  "reservation_record": '預訂記錄',

//Reservation
  'pending': '處理中',
  'past_records': '過往記錄',
  "reservation": '預訂',

//Cancel Booking Dialog
  "cancel_booking_title": '你確認取消預訂?',
  "date_display_dialog": '選擇日期',
  "time_display_dialog": '選擇時段',
  "person_display_dialog": '使用人數',
  "back_dialog": '返回',
  "cancel_dialog": '取消',
  "booking_cancel": '預訂已取消',
  "past_records_completed": '完成',
  "past_records_cancelled": '已取消',
  "past_records_overdue_payments": '逾期付款',
  "pay_before": '請於此日期前付款',
  "cancelled": '已取消',

//Milestone 4
//Booking Details
  "select_date": '選擇日期',
  "select_time": '選擇時間',
  "select_pax": '人數',
  "select_date_valid": '選擇日期',
  "select_time_valid": '選擇時段',
  "select_pax_valid": '人數',
  "usage_details": '使用詳情',
  "per_session_topic": '每節',
  "days": '日',
  "opening_hours": '開放時間',
  "charge": '收費',
  "reserve": '預訂',
  "select": '選擇',
  "adult": '成人',
  "children": '小童',
  "please_check_your_booking_info": '請檢查您的預訂信息',
  "please_pay": '請於此日期',
  "please_confirm": '前付款確認訂單.',
  "baby": '嬰兒',
  "babyMain": '(3歲以下)',
  "booked_successfully": '成功預訂',
  "pay_by_date": '請在指定日期前付款',
  "select_date_validation": '請選擇日期',
  "select_time_validation": '請選擇時間',
  "select_person_validation": '請選擇人數',
  "select_adult_validation": '至少需要一位成人',
  "time_not_available": '此日期無法預訂，請選擇其他日期',

//Milestone 5
//Easy Living Info
  'easy_living_title': '生活必備',
  'interchange': '換乘',
  'service_hours': '服務時間',
  'call_us': '致電我們',
  'maintenance_day': '維護日',

//Milestone 6
  'password_changed': '密碼已更改',
  'change_password': '更改密碼',
  'confirm_new_password': '確認新密碼',
  'please_enter_the_confirm_password': '請輸入確認密碼',
  'confirm_Password_validation': '確認密碼必須超過 6 個字符',
  'password_same': '密碼和確認密碼必須相同',
  'setting': '設定',
  'settings': '設定',
  'push_notification': '推送通知',
  'off': '關',
  'on': '開',
  'change_language': '切換語言/Change Language',
  'english': 'English',
  'clear_cached_data': '清除緩存數據',
  'clear_cache_data_val': '12.3M',
  'about': '關於',
  'version': '版本',
  'version_val': '3.0.0',
  'disclaimer_privacy_policy': '免責聲明和隱私政策',
  'feedback': '回饋',
  'about_cic': '關於逸峯薈',
  'rating_reviews': '評級和評論',
  'ereseident_card': '電子住戶證',
  'logOut': '登出',
  'logOut_successfully': '註銷成功',

//Milestone 8
  'contact_us': '聯絡我們',
  'green_code_management_title': '逸峯薈管業處',
  'app_technical_title': 'App 技術支援 : ChillWeb.io',
  'edit': '編輯',
  'done': '完成',
  'notification_title': '通知中心',
  'system': '系統',
  'read': '閱讀',
  'delete': '刪除',
  'confirmed_to_delete': '是否確認刪除?',

//Milestone 9
  'eresident_card': '電子住戶證',
  'you_cannot_scan_your_own_qr_code': "無法掃描二維碼.",
  'first_name': '名字',
  'last_name': '姓氏',
  'mobile_no': '手提電話號碼',
  'address': '地址',
  'user_number': '用戶號碼',
  'qr_hint': '將二維碼置於框內即可自動掃描',

  'flat_number_code': '平面號碼代碼',
  'resident_name': '居民類型',
  'club_maintanace_toast': '俱樂部在所選時間進行維護，請稍後查看。',

//New

  'forgot_id': '忘記編號?',
  'pass_code': '驗證碼',
  'resident_id_upper': '住戶編號',
  'password_upper': '密碼',
  'sign_up': '註冊',
  'sign_in': '登入',
  'send_new_pass_code': '發送新驗證碼',

  'forgot_your_id': '忘记住户編號?',
  'forgot_id_content': '如果你忘記了住戶編號，請在辦公時間聯繫管理處進行處理。',
  'pass_code_sent': '已發送驗證碼',
  'pass_code_content':
      '新驗證碼已經發送到你的電郵，請使用該驗證碼重置您的密碼。如果您沒有收到驗證碼，請檢查您的垃圾郵件或聯絡管理處。',

  'monday' : '星期一',
  'tuesday' : '星期二',
  'wednesday' : '星期三',
  'thursday' : '星期四',
  'friday' : '星期五',
  'saturday' : '星期六',
  'sunday' : '星期日',

  'paid' : '已付款',

  'label1':'九巴',
  'label2':'城巴',
  'label3':'新巴',
  'label4':'運輸署',

  'call_now':'立即撥打電話:',
  'visit_website':'訪問網站:'

// //Common
//   'data_not_found': '未找到数据',
//   'submit': '提交',
//
// //Milestone 1
// //Sign In        註册
//   'email': '电子邮件地址',
//   'resident_id': '居民身份证',
//   'password': '密码',
//   'login': '登入',
//   'enter_email_password': '请输入居民身份證和密码',
//   'enter_email': '请输入电邮地址',
//   'valid_email': '请输入有效电邮地址',
//   'enter_password': '请输入密码',
//   'valid_password': '密码必须多於 6 个字符',
//   'enter_resident_id': "请输入居民身份证",
//   'forgot_password': '忘记密码',
//
// //Forgot Password   忘记密码
//   'forgot_password_title': '忘记密码',
//   'email_address': '电邮地址',
//   'enter_email_forgot': '输入电邮地址',
//   'verify_code': '验證码',
//   'verification_code': '验证码',
//   'enter_verification_code': '输入验证码',
//
// //OTP Verification
//   'valid_otp': '请输入有效的一次性密码',
//   'enter_verify_code': '输入验證码',
//   'confirm': '确认',
//   'otp_span1': "无法收到验證码",
//   'resend': '重发',
//
// //Reset Password
//   'reset_password': '重设密码',
//   'enter_new_password': '请输入新密码',
//   'reconfirm_password': '重新确认密码',
//   'enter_reconfirm_password': '重新输入密码',
//   'please_enter_new_password': '重新输入新密码',
//   'please_enter_new_valid_password': '新密码必须多於 6 个字符',
//   'please_enter_reconfim_password': '请输入重新确认密码',
//   'please_enter_reconfirm_valid_password': '重设密码必须超过 6 个字符',
//   'password_not_match': "新密码和确认密码不匹配",
//
// //Milestone 2
// //Home
//   'main_page': '主页',
//   'qr_code': '二维码',
//   'booking': '预订',
//   'notification': '通告',
//   'estate_info_home': '屋苑通告',
//   'booking_home': '预订',
//   'easy_living_home': '生活必备',
//   'my_account_home': '我的帐号',
//   'e_resident_card_home': '逸峯荟住户E咭',
//   'notification_home': '通告',
//   'observatory_home': '天气报告',
//
// //Estate Info List
//   'estate_info_title': '屋苑消息',
//
// //Estate Fund Type List
//   'estate_fund_type_title': '屋苑通告',
//
// //Milestone 3
// //Booking
//   "reservation_record": '预订纪录',
//
// //Reservation
//   'pending': '待确认',
//   'past_records': '过往纪录',
//   "reservation": '预订',
//
// //Cancel Booking Dialog
//   "cancel_booking_title": '是否取消预订?',
//   "date_display_dialog": '请选择日期',
//   "time_display_dialog": '请选择时段',
//   "person_display_dialog": '参与人数',
//   "back_dialog": '返回',
//   "cancel_dialog": '取消',
//   "booking_cancel": '预订经已取消',
//   "past_records_completed": '完成',
//   "past_records_cancelled": '取消',
//   "past_records_overdue_payments": '逾期付款',
//   "pay_before": '请於此日期前缴付',
//   "cancelled": '已取消',
//
// //Milestone 4
// //Booking Details
//   "select_date": '请选择日期',
//   "select_time": '请选择时间',
//   "select_pax": '人数',
//   "select_date_valid": '已选择日期',
//   "select_time_valid": '已选择时段',
//   "select_pax_valid": '人数',
//   "usage_details": '使用详情',
//   "per_session_topic": '每个时段',
//   "days": '日',
//   "opening_hours": '开放时间',
//   "charge": '收费',
//   "reserve": '预订',
//   "select": '选择',
//   "adult": '成人',
//   "children": '小童',
//   "please_check_your_booking_info": '请查看你的预订资料',
//   "please_pay": '支付方式',
//   "please_confirm": '确认预订後',
//   "baby": '婴儿',
//   "babyMain": '叁岁以下',
//   "booked_successfully": '预订成功',
//   "pay_by_date": '请於指定日期付款',
//   "select_date_validation": '请选择日期',
//   "select_time_validation": '请选择时间',
//   "select_person_validation": '请选择人数',
//   "select_adult_validation": '预定需要最少一位成年人',
//   "time_not_available": '此日期无法预订，请选择其他日期',
//
// //Milestone 5
// //Easy Living Info
//   'easy_living_title': '生活必备',
//   'interchange': '换乘',
//   'service_hours': '服务时间',
//   'call_us': '致电我们',
//   'maintenance_day': '维修日',
//
// //Milestone 6
//   'password_changed': '密码已更改',
//   'change_password': '更改密码',
//   'confirm_new_password': '确认新密码',
//   'please_enter_the_confirm_password': '请输入确认密码',
//   'confirm_Password_validation': '确认密码必须超过 6 个字符',
//   'password_same': '密码与确认密码必须一致',
//   'setting': '设定',
//   'settings': '设定',
//   'push_notification': '推送通知',
//   'off': '关',
//   'on': '开',
//   'change_language': '切换语言/Change Language',
//   'english': '英语',
//   'clear_cached_data': '清除缓存数据',
//   'clear_cache_data_val': '12.3M',
//   'about': '关於',
//   'version': '版本',
//   'version_val': '3.0.0',
//   'disclaimer_privacy_policy': '免责声明和隐私政策',
//   'feedback': '回馈',
//   'about_cic': '关於逸峯荟',
//   'rating_reviews': '评级和评论',
//   'ereseident_card': '逸峯荟住户E咭',
//   'logOut': '登出',
//
// //Milestone 8
//   'contact_us': '联络我们',
//   'green_code_management_title': '逸峯物业管理办公室',
//   'app_technical_title': 'App技术支援 : Chillweb.io',
//   //(need to change to Chillweb.io)
//   'edit': '编辑',
//   'done': '完成',
//   'notification_title': ' 讯息中心',
//   'system': '系统',
//   'read': '已读',
//   'delete': '删除',
//   'confirmed_to_delete': '确认删除',
// // '':'',
//
// //Milestone 9
//   'eresident_card': '逸峯荟住户E咭',
//   'you_cannot_scan_your_own_qr_code': "您无法扫描你的二维码。",
//   'first_name': '名字',
//   'last_name': '姓氏',
//   'mobile_no': '手机号码',
//   'address': '地址',
//   'user_number': '用户号码',
//   'qr_hint': '将二维码放方框内自动扫描',
//
//   'flat_number_code': '平面号码代码',
//   'resident_name': '居民类型',
//
//   'club_maintanace_toast': '俱乐部在所选时间进行维护，请稍後查看'
};
