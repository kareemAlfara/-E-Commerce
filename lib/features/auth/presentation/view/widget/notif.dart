import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> sendNotification({
  required String receiverId, // who gets the notification
  required String deviceToken, // their FCM token
  required String title,
  required String body,
}) async {
  const supabaseUrl = 'https://euudvrftyscplhfwzxli.functions.supabase.co';
  const functionName = 'smooth-worker';
  const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1dWR2cmZ0eXNjcGxoZnd6eGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyMDg3MDksImV4cCI6MjA3MTc4NDcwOX0.coxogvY2IS51RAZ4gJAtaUNhX4ZtxEifHwnWBhO1U_8'; // or service role if needed

  // 1️⃣ Send push via Supabase Edge Function
  final response = await http.post(
    Uri.parse('$supabaseUrl/$functionName'),
    headers: {
      'Authorization': 'Bearer $anonKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({'token': deviceToken, 'title': title, 'body': body}),
  );

  // 2️⃣ Always insert into notifications table
  await Supabase.instance.client.from('notifications').insert({
    'user_id': receiverId,
    'title': title,
    'body': body,
    'read': false,
  });

  if (response.statusCode == 200) {
    print('Notification sent & saved!');
  } else {
    print('Failed: ${response.statusCode}  ${response.body}');
  }
  
}
