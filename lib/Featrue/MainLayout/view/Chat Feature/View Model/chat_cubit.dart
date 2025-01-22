import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/Add Reaction Model/Add Reaction Model.dart';
import '../Model/My Chats Model/My Chats Model.dart';
import '../Model/Send Message Model/Send Message Model.dart';
import '../Model/Spicific Chat Messages/Spicific Chat Messages.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  // Added user with ID: 674715885fb31f7806d196c9
  // Added room : 677344893acc03f69929812b
  // Added user with ID: 670149bd8862beddfe6ca45c
  // Added room : 677344893acc03f69929812b


  // 676eeaa59e5aa749202a82d4

  // chat id : 6783171ba85c61cca7c90728
  static ChatCubit get(context) => BlocProvider.of(context);

  MyChatsModel? myChatsModel;
  SpecificChatMessages? specificChatMessages;
  SpecificChatMessages? receiveMessageModel;
  SendMessageModel? sendMessageModel;
  AddReactionModel? addReactionModel;
  List<Chats> myChats = [];

  void cancelReplay() {
    repliedTo = null;
    emit(CancelReplay());
  }

  void addReplay(RepliedTo replayMessage) {
    repliedTo = replayMessage;

    emit(AddReplay());
  }

  RepliedTo? repliedTo;

  Future<void> getHomeChats() async {
    emit(GetHomeChatLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.chats,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);
      myChatsModel = MyChatsModel.fromJson(response.data);
      emit(GetHomeChatSuccess());
    } catch (e) {
      emit(GetHomeChatError());
    }
  }

  Future<void> getSpecificChatMessages({
    required String ID,
    required String pageNum,
  }) async {
    emit(GetSpecificChatMessagesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.messages}/$ID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          query: {'page': pageNum});
      specificChatMessages = SpecificChatMessages.fromJson(response.data);
      print(specificChatMessages);
      for (var element in specificChatMessages!.chats!) {
        myChats.insert(0, element);
      }
      emit(GetSpecificChatMessagesSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetSpecificChatMessagesError());
    }
  }

  Future<void> sendTextMessages(
      {required String ChatID,
      required String message,
      required String receiverId,
      required TextEditingController controller,
      required bool isGroub,
      List<Participants>? participants}) async {
    try {
      print(isGroub);
      var uuid = Uuid();
      String uid = uuid.v1();

      Chats chat = Chats(
          id: uid,
          chat: '',
          sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          text: message,
          media: [],
          reactions: [],
          isRead: false,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);
      controller.clear();

      emit(AddMessageToChat());

      if (!isGroub) {
        sendPrivateMessage(
            senderId: LoginCubit.id,
            receiverId: receiverId,
            text: message,
            ownMessageName: LoginCubit.name);
      } else {
        int num = 0;
        joinRoom(LoginCubit.id, ChatID);

        for (var element in participants!) {
          joinRoom(element.userDetails.id, ChatID);
          print('id isssssssssssssssssssssssssssssssssssssss');
          print(element.userDetails!.id);
        }
        sendGroupMessage(LoginCubit.id, ChatID, message, '');
      }
      final response = await DioHelper.post(
          end_ponit: '${EndPoints.messages}/$ChatID',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'text': message});
      sendMessageModel = SendMessageModel.fromJson(response.data);
      //
      for (var element in myChats) {
        if (element.text == message &&
            element.isRead == false &&
            element.id == uid) {
          element.id = sendMessageModel!.id;
          print('OLD Message ID is ${uid}');

          print('New Message ID is ${sendMessageModel!.id}');
        }
      }

      getHomeChats();
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }

  Future<void> ReplayTextMessages({
    required String MessageID,
    required String ChatID,
    required String message,
    required String receiverId,
    required TextEditingController controller,
    required bool isGroub,
    required String ReplyMessage,
    List<Participants>? participants,
    required String ReplyMessageId,
  }) async {
    try {
      print(isGroub);
      Chats chat = Chats(
          id: '',
          chat: '',
          sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          text: message,
          media: [],
          repliedTo: RepliedTo(
            Id: MessageID,
            text: ReplyMessage,
            sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          ),
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());
      myChats.add(chat);

      DioHelper.post(
          end_ponit: '${EndPoints.messages}/$MessageID/${EndPoints.reply}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'text': message});

      if (!isGroub) {
        sendReplayPrivateMessage(
            senderId: LoginCubit.id,
            receiverId: receiverId,
            text: message,
            ownMessageName: LoginCubit.name,
            repliedToMessageData: ReplyMessage,
            repliedToMessageId: MessageID);
      } else {
        int num = 0;
        joinRoom(LoginCubit.id, ChatID);

        for (var element in participants!) {
          joinRoom(element.userDetails.id, ChatID);
          print('id isssssssssssssssssssssssssssssssssssssss');
          print(element.userDetails!.id);
        }
        sendGroupMessage(LoginCubit.id, ChatID, message, '');
      }

      getHomeChats();
      controller.clear();
      repliedTo = null;
      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }

  // Send File Section

  Future<void> sendFileMessages({
    required String chatID,
    String? message,
    required String receiverId,
    required bool isGroup,
    required List<File> files, // List of files (images, PDFs, Word documents)
    List<Participants>? participants,
  }) async {
    try {
      // Create media data
      List<Map<String, dynamic>> mediaData = [];

      for (var file in files) {
        String fileName = file.path.split('/').last;

        String fileUrl =
            await uploadFile(file); // Implement this function for uploading

        mediaData.add({
          'fileName': fileName,
          'url': fileUrl,
        });
      }

      // Send message with text and media
      final response = await DioHelper.post(
        end_ponit: '${EndPoints.messages}/$chatID',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        data: {
          'text': message ?? '',
          'media': mediaData,
        },
      );

      print('=========================>Api Request Sent Successfully');
      sendMessageModel = SendMessageModel.fromJson(response.data);

      print('=========================>model Stored Successfully');

      Chats chat = Chats(
          id: '',
          chat: '',
          sender: Sender(id: LoginCubit.id, username: LoginCubit.name),
          text: message ?? '',
          media: sendMessageModel?.media!,
          reactions: [],
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString());

      print('Chat is =========================> $chat');
      myChats.add(chat);
      print('=========================> Chat Added Successfully');
      emit(AddImageToChat());
      List<String> media = [];
      for (var element in sendMessageModel!.media!) {
        media.add(element.url!);
      }
      print('=========================> before sendPrivateMessage by socket');
      sendPrivateMessage(
          senderId: LoginCubit.id,
          receiverId: receiverId,
          text: '',
          media: media,
          ownMessageName: LoginCubit.name);

      print('=========================> after sendPrivateMessage by socket');

      getHomeChats();

      emit(SendMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(SendMessageError());
    }
  }

  Future<String> uploadFile(File file) async {
    // Replace this logic with actual file upload (e.g., Firebase, AWS S3, etc.)
    // Simulate upload and return file URL
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    print(file.path.split('/').last);
    return 'https://L.s_fitness/uploads/${file.path.split('/').last}';
  }

  Future<List<File>> pickFiles() async {
    List<File> pickedFiles = [];

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'pdf',
          'doc',
          'docx',
          'png',
          'jpeg',
          'gif',
          'mp4',
          'mp3',
          'audio',
          'zip',
          'rar',
        ], // Add allowed extensions
      );

      if (result != null) {
        pickedFiles = result.paths.map((path) => File(path!)).toList();
      }
    } catch (e) {
      print("Error picking files: $e");
    }

    return pickedFiles;
  }

  Future<void> handleSendMessage(
      {required String chatID, required String receiverId}) async {
    print("handleSendMessage");
    List<File> selectedFiles = await pickFiles(); // استدعاء دالة اختيار الملفات
    print("Selected files: $selectedFiles");
    if (selectedFiles.isNotEmpty) {
      await sendFileMessages(
        chatID: chatID,
        message: "",
        receiverId: receiverId,
        isGroup: false,
        files: selectedFiles,
      );
    } else {
      print("No files selected.");
    }
  }

  // End Send File Section

  //SendReaction
  void updateReactionIfExists({
    required List<Chats> myChats,
    required int index,
    required Reactions newReaction,
    required String userIdToCheck,
  }) {
    // تحقق من وجود الرياكشنات
    if (myChats[index].reactions == null) {
      myChats[index].reactions = [];
    }

    // ابحث عن الرياكشن الخاص بالمستخدم المطلوب
    int existingReactionIndex = myChats[index].reactions!.indexWhere(
        (reaction) =>
            reaction.user != null && reaction.user!.sId == userIdToCheck);

    if (existingReactionIndex != -1) {
      // إذا وُجد، قم بتحديث الرياكشن
      myChats[index].reactions![existingReactionIndex] = newReaction;
    } else {
      // إذا لم يُوجد، أضف الرياكشن الجديد
      myChats[index].reactions!.add(newReaction);
    }
  }

  Future<void> addReactionToMessage(
      {required String senderId,
      required String receiverId,
      required String messageId,
      required String emoji,
      required int index}) async {
    emit(AddReactionToMessageLoading());
    try {
      print(messageId);
      sendEmoji(senderId, receiverId, messageId, emoji);
      Reactions newReaction = Reactions(
        user: User(sId: LoginCubit.id, username: LoginCubit.name),
        emoji: emoji,
        id: '',
      );
      updateReactionIfExists(
        myChats: myChats,
        index: index,
        newReaction: newReaction,
        userIdToCheck: LoginCubit.id,
      );

      print(specificChatMessages!.chats![index].text);
      emit(ChangeReactionId());

      final response = await DioHelper.post(
          end_ponit: '${EndPoints.messages}/$messageId/${EndPoints.reactions}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {'emoji': emoji});
      addReactionModel = AddReactionModel.fromJson(response.data);
      myChats[index].reactions!.last.id = addReactionModel!.data!.id;

      emit(AddReactionToMessageSuccess());
    } catch (e) {
      print(e.toString());
      emit(AddReactionToMessageError());
    }
  }

  late IO.Socket _socket;
  static FlutterLocalNotificationsPlugin localNotifications =
  FlutterLocalNotificationsPlugin();
  var initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings());



  Future<void> showNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    const platformDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);

    await localNotifications.show(
      DateTime.now().millisecond,
      title,
      body,
      platformDetails,
    );
  }
  // Initialize the connection


  void connect(String userId, String roomId) {
    localNotifications.initialize(initSettings);

    print('begain connect');
      _socket = IO.io('https://ls-fitness.koyeb.app', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });

      _socket.connect();

      // Handle connection events
      _socket.onConnect((_) {
        _socket.emit('addUser', {"userId": userId});
        print('Connected to Socket.IO server');
      });

      _socket.onDisconnect((_) {
        print('Disconnected from Socket.IO server');
      });

      // Handle incoming messages
      _socket.on('receiveMessage', (data) async {
        showNotification( data['senderName'], data['text']);
        DateTime dateTime = DateTime.now();
        print(dateTime);
        print('New message received: $data');
        var uuid = Uuid();
        String uid = uuid.v1();

        Chats chat = Chats(
            id: uid,
            chat: '',
            sender: Sender(id: data['senderId'], username: ''),
            text: data['text'],
            media: data['media'] != null ? [Media.fromJson(data['media'])] : [],
            reactions: [],
            isRead: false,
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString());
        myChats.add(chat);

        emit(GetSpecificChatMessagesSuccess());
        await DioHelper.get(
            end_ponit: '${EndPoints.messages}/$roomId',
            token: LoginCubit.loginModel?.token ?? LoginCubit.token,
            query: {'page': 1}).then((_) {
          print(_.data);
          receiveMessageModel = SpecificChatMessages.fromJson(_.data);
          print('===============>receiveMessageModel');
          print(receiveMessageModel!.chats);
        });

        for (var element in myChats) {
          if (element.text == data['text'] &&
              element.isRead == false &&
              element.id == uid) {
            if (receiveMessageModel!.chats!.first.text == data['text']) {
              element.id = receiveMessageModel!.chats!.first.id;

            }
            print('OLD Message ID is ${uid}');

            print('New Message ID is ${element.id}');
          }
        }

        getHomeChats();
      });

      _socket.on('receiveRepliedMessage', (data) {
        print('New receiveRepliedMessage received: $data');

        Chats chat = Chats(
            id: '',
            chat: '',
            sender:
            Sender(id: data['senderId'], username: data['ownMessageName']),
            text: data['text'],
            media: data['media'] != null ? data['media'] : [],
            repliedTo: RepliedTo(
              text: data['repliedToMessageData'],
              sender:
              Sender(id: data['senderId'], username: data['ownMessageName']),
              Id: data['repliedToMessageId'],
              media: [],
            ),
            reactions: [],
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString());
        myChats.add(chat);
        getHomeChats();

        emit(GetSpecificChatMessagesSuccess());
      });

      _socket.on('receiveReactionToMessage', (data) {
        print('New Reaction received: $data');

        Reactions newReaction = Reactions(
          user: User(sId: data["senderId"], username: ''),
          emoji: data["emoji"],
          id: '',
        );
        for (var element in myChats) {
          if (element.id == data["messageId"]) {
            updateReactionIfExists(
              myChats: myChats,
              index: myChats.indexOf(element),
              newReaction: newReaction,
              userIdToCheck: data["senderId"],
            );
          }
        }

        getHomeChats();

        emit(GetSpecificChatMessagesSuccess());
      });

      _socket.on('errorMessage', (error) {
        print('Error: $error');
      });



    // Connect to the server
  }



  // Join a room
  void joinRoom(String userId, String roomId) {
    print('joinRoom doneeeeeeeeeeee');
    _socket.emit('joinRoom', {'userId': userId, 'roomId': roomId});
  }

  // Leave a room
  void leaveRoom(String userId, String roomId) {
    _socket.emit('leaveRoom', {'userId': userId, 'roomId': roomId});
  }

  // Send a private message
  void sendPrivateMessage({
    required String senderId,
    required String receiverId,
    required String text,
    required String ownMessageName,
    List<String>? media,
  }) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'ownMessageName': ownMessageName,
      'media': media
    });
    print('sendPrivateMessage doneeeeeeeeeeee to id ${receiverId}');
  }

  void sendReplayPrivateMessage({
    required String senderId,
    required String receiverId,
    required String text,
    required String ownMessageName,
    required String repliedToMessageData,
    required String repliedToMessageId,
    List<String>? media,
  }) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'ownMessageName': ownMessageName,
      'repliedToMessageData': repliedToMessageData,
      'repliedToMessageId': repliedToMessageId,
      'media': media,
    });
    print('sendReplayPrivateMessage doneeeeeeeeeeee to id ${receiverId}');
  }

  void sendEmoji(
      String senderId, String receiverId, String messageId, String emoji) {
    _socket.emit('toggleReaction', {
      'senderId': senderId,
      'receiverId': receiverId,
      'messageId': messageId,
      'emoji': emoji
    });

    print('sendEmoji doneeeeeeeeeeee');
  }

  // Send a group message
  void sendGroupMessage(
      String senderId, String roomId, String payload, String action) {
    _socket.emit('sendMessage', {
      'senderId': senderId,
      'roomId': roomId,
      'payload': payload,
      'action': action,
    });
    print('sendGroupMessage doneeeeeeeeeeee');
  }

  // Disconnect from the server
  void disconnect() {
    _socket.disconnect();
  }
}
