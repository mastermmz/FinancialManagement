import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:modiriyatmali/Models/moneyBlock.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

 void ferstReadSms(context) async {
  // print("salam");
   SharedPreferences par = await SharedPreferences.getInstance();
   final SmsQuery _query = SmsQuery();
  var permission = await Permission.sms.status;
  if (permission.isGranted) {
    final messages = await _query.querySms(
      kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
      address: 'KESHAVARZI',
      count: 1,
    );
    // print(messages[0].body);
    final msgList = messages[0].body?.split("\n");
    final idLastmsd = messages[0].id;
    // String msg = msgList![0];
    // print(msgList![0]);
    String msg = msgList![1].replaceAll(",", "").replaceAll("مانده", "");
    // print(int.parse(msg));
    BlocProvider.of<KeshavarziBloc>(context).add(Addnumber(addMoney: int.parse(msg)));
    await par.setInt("lastID", idLastmsd!);
    await par.setInt("KESHAVARZI", int.parse(msg));
  } else {
    await Permission.sms.request();
  }
}

Future<void> loadSms() async {
  print(".................................");
  final SmsQuery _query = SmsQuery();
  final messages = await _query.querySms(
    kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
    address: 'KESHAVARZI',
    count: 20,
  );
  print(messages.length);
    print(messages[0].isRead!);
    print(messages[0].body);
    print(".................................");
    print(messages[0].id.runtimeType);
}