import 'package:flutter/material.dart';

// Chinese Translations
const Map<String, String> zhSC = {
//Common
  'data_not_found': '未找到数据',
  'submit': '提交',
  'description': '描述',

//Milestone 1
//Sign In
  'email': '电邮',
  'resident_id': '住户编号',
  'password': '密码',
  'login': '登入',
  'enter_email_password': '输入密码',
  'enter_email': '输入电邮地址',
  'valid_email': '输入有效电邮',
  'enter_password': '输入密码',
  'valid_password': '密码必须多於 6 个字符',
  'enter_resident_id': "请输入住户身份号",
  'forgot_password': '忘记密码?',

//Forgot Password
  'forgot_password_title': '忘记密码?',
  'email_address': '电邮',
  'enter_email_forgot': '输入电邮地址',
  'verify_code': '验證码',
  'verification_code': '验證码',
  'enter_verification_code': '输入验證码',

//OTP Verification
  'valid_otp': '请输入有效的一次性密码',
  'enter_verify_code': '输入验證码',
  'confirm': '确认',
  'otp_span1': "收不到验證码? ",
  'resend': '重发',

//Reset Password
  'reset_password': '重设密码',
  'enter_new_password': '输入新密码',
  'reconfirm_password': '确认密码',
  'enter_reconfirm_password': '输入确认密码',
  'please_enter_new_password': '请输入新密码',
  'please_enter_new_valid_password': '新密码必须多於 6 个字符',
  'please_enter_reconfim_password': '请输入重新确认密码',
  'please_enter_reconfirm_valid_password': '确认密码必须超过 6 个字符',
  'password_not_match': "新密码和确认密码不符合",

//Milestone 2
//Home
  'main_page': '主页',
  'qr_code': '二维码',
  'booking': '预订',
  'notification': '通知',
  'estate_info_home': '屋苑通告',
  'booking_home': '预订',
  'easy_living_home': '生活必备',
  'my_account_home': '我的帐号',
  'e_resident_card_home': '电子住户證',
  'notification_home': '通知',
  'observatory_home': '香港天文台',

//Estate Info List
  'estate_info_title': '屋苑通告',

//Estate Fund Type List
  'estate_fund_type_title': '屋苑通告',

//Milestone 3
//Booking
  "reservation_record": '预订记录',

//Reservation
  'pending': '处理中',
  'past_records': '过往记录',
  "reservation": '预订',

//Cancel Booking Dialog
  "cancel_booking_title": '你确认取消预订?',
  "date_display_dialog": '选择日期',
  "time_display_dialog": '选择时段',
  "person_display_dialog": '使用人数',
  "back_dialog": '返回',
  "cancel_dialog": '取消',
  "booking_cancel": '预订已取消',
  "past_records_completed": '完成',
  "past_records_cancelled": '已取消',
  "past_records_overdue_payments": '逾期付款',
  "pay_before": '请於此日期前付款',
  "cancelled": '已取消',

//Milestone 4
//Booking Details
  "select_date": '选择日期',
  "select_time": '选择时间',
  "select_pax": '人数',
  "select_date_valid": '选择日期',
  "select_time_valid": '选择时段',
  "select_pax_valid": '人数',
  "usage_details": '使用详情',
  "per_session_topic": '每节',
  "days": '日',
  "opening_hours": '开放时间',
  "charge": '收费',
  "reserve": '预订',
  "select": '选择',
  "adult": '成人',
  "children": '小童',
  "please_check_your_booking_info": '请检查您的预订信息',
  "please_pay": '请於此日期',
  "please_confirm": '前付款确认订单.',
  "baby": '婴儿',
  "babyMain": '(3岁以下)',
  "booked_successfully": '成功预订',
  "pay_by_date": '请在指定日期前付款',
  "select_date_validation": '请选择日期',
  "select_time_validation": '请选择时间',
  "select_person_validation": '请选择人数',
  "select_adult_validation": '至少需要一位成人',
  "time_not_available": '此日期无法预订，请选择其他日期',

//Milestone 5
//Easy Living Info
  'easy_living_title': '生活必备',
  'interchange': '换乘',
  'service_hours': '服务时间',
  'call_us': '致电我们',
  'maintenance_day': '维护日',

//Milestone 6
  'password_changed': '密码已更改',
  'change_password': '更改密码',
  'confirm_new_password': '确认新密码',
  'please_enter_the_confirm_password': '请输入确认密码',
  'confirm_Password_validation': '确认密码必须超过 6 个字符',
  'password_same': '密码和确认密码必须相同',
  'setting': '设定',
  'settings': '设定',
  'push_notification': '推送通知',
  'off': '关',
  'on': '开',
  'change_language': '切换语言/Change Language',
  'english': 'English',
  'clear_cached_data': '清除缓存数据',
  'clear_cache_data_val': '12.3M',
  'about': '关於',
  'version': '版本',
  'version_val': '3.0.0',
  'disclaimer_privacy_policy': '免责声明和隐私政策',
  'feedback': '回馈',
  'about_cic': '关於逸峯荟',
  'rating_reviews': '评级和评论',
  'ereseident_card': '电子住户證',
  'logOut': '登出',
  'logOut_successfully': '注销成功',

//Milestone 8
  'contact_us': '联络我们',
  'green_code_management_title': '逸峯荟管业处',
  'app_technical_title': 'App 技术支援 : ChillWeb.io',
  'edit': '编辑',
  'done': '完成',
  'notification_title': '通知中心',
  'system': '系统',
  'read': '阅读',
  'delete': '删除',
  'confirmed_to_delete': '是否确认删除?',

//Milestone 9
  'eresident_card': '电子住户證',
  'you_cannot_scan_your_own_qr_code': "无法扫描二维码.",
  'first_name': '名字',
  'last_name': '姓氏',
  'mobile_no': '手提电话号码',
  'address': '地址',
  'user_number': '用户号码',
  'qr_hint': '将二维码置於框内即可自动扫描',

  'flat_number_code': '平面号码代码',
  'resident_name': '居民类型',
  'club_maintanace_toast':
      '俱乐部在所选时间进行维护，请稍后查看。',

  //New

  'forgot_id': '忘记编号?',
  'pass_code': '验证码',
  'resident_id_upper': '住户编号',
  'password_upper': '密码',
  'sign_up': '注册',
  'sign_in': '登入',
  'send_new_pass_code': '发送新验证码',

  'forgot_your_id': '忘记住户编号?',
  'forgot_id_content': '如果你忘记了住户编号，请在办公时间联系管理处进行处理。',
  'pass_code_sent': '已发送验证码',
  'pass_code_content':
      '新验证码已经发送到你的电邮，请使用该验证码重置您的密码。如果您没有收到验证码，请检查您的垃圾邮件或联络管理处。',

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
  'label4':'运输署',

  'call_now':'立即拨打电话:',
  'visit_website':'访问网站:'
};
