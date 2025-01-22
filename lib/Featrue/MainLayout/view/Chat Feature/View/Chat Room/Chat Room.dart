import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Chat%20Feature/Model/Spicific%20Chat%20Messages/Spicific%20Chat%20Messages.dart';
import 'package:ls/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Chat%20Feature/View%20Model/chat_cubit.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../Model/My Chats Model/My Chats Model.dart';

class ChatRoom extends StatefulWidget {
  final String id;
  final String roomId;
  final String name;
  final bool isGroup;
  final List<Participants> participants;

  ChatRoom({required this.name,
    required this.id,
    required this.roomId,
    required this.isGroup,
    required this.participants});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  OverlayEntry? _emojiOverlay;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  void _showEmojiPicker(BuildContext context, Offset offset, String messageID,
      int index) {
    final overlay = Overlay.of(context);
    final screenSize = MediaQuery
        .of(context)
        .size;
    print(screenSize.width);

    double left = offset.dx;
    double top = offset.dy;

    print(left);

    _emojiOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 0,
          top: top + 35,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.5),
                    color: Colors.white12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _emojiButton('👍', messageID, index),
                    _emojiButton('❤️', messageID, index),
                    _emojiButton('😂', messageID, index),
                    _emojiButton('😮', messageID, index),
                    _emojiButton('😢', messageID, index),
                    _emojiButton('💪🏻', messageID, index),
                    _emojiButton('🦍', messageID, index),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(_emojiOverlay!);
    _animationController.forward(); // بدء الحركة
  }

  Widget _emojiButton(String emoji, String messageID, int index) {
    return GestureDetector(
      onTap: () {
        ChatCubit.get(context).addReactionToMessage(
            senderId: LoginCubit.id,
            receiverId: widget.id,
            messageId: messageID,
            emoji: emoji,
            index: index);
        _animationController.reverse().then((_) {
          _emojiOverlay?.remove();
          _emojiOverlay = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You selected $emoji')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  void initState() {
    ChatCubit.get(context).connect(LoginCubit.id, widget.roomId );

    super.initState();
    ChatCubit.get(context).getSpecificChatMessages(
        ID: widget.roomId, pageNum: currentPage.toString());

    _scrollController.addListener(() {
      print(
          '_scrollController.position.minScrollExtent is ${_scrollController
              .position.minScrollExtent - 010}');
      print(
          '_scrollController.position.pixels is ${_scrollController.position
              .pixels}');

      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels ==
            _scrollController.position.minScrollExtent) {
          currentPage++;
          ChatCubit.get(context).getSpecificChatMessages(
              ID: widget.roomId, pageNum: currentPage.toString());
        }
      }
    });
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void deactivate() {
    print('chat room dispose');
    ChatCubit
        .get(context)
        .specificChatMessages = null;
    ChatCubit
        .get(context)
        .myChats = [];

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: width * .047,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/half-length-close-up-portrait-young-hindoo-man-white-shirt-blue-space_155003-26772.jpg?t=st=1735759637~exp=1735763237~hmac=2df5ba350ac04b076137753a0b7ed6b487d3a81a585d75bd76f5b974e3c767a0&w=900'),
            ),
            SizedBox(width: 10),
            Text(
              widget.name,
              style: TextStyle(color: Colors.white, fontSize: width * .0435),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          _animationController.reverse().then((_) {
            _emojiOverlay?.remove();
            _emojiOverlay = null;
          });
        },
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                ChatCubit
                    .get(context)
                    .specificChatMessages != null
                    ? ChatCubit
                    .get(context)
                    .myChats
                    .isNotEmpty
                    ? Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(16),
                        itemCount:
                        ChatCubit
                            .get(context)
                            .myChats
                            .length,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(
                              ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .createdAt!);
                          String timeAgo = timeago.format(dateTime);
                          return GestureDetector(
                            onHorizontalDragEnd: (_) {
                              print('drag');
                              print(index);
                              print(ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .media?[0]);
                            },
                            onLongPressStart: (details) {
                              _showEmojiPicker(
                                  context,
                                  details.globalPosition,
                                  ChatCubit
                                      .get(context)
                                      .myChats[index]
                                      .id
                                      .toString(),
                                  index);
                            },
                            child: ChatBubble(
                              message: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .text!,
                              isSentByMe: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .sender!
                                  .id ==
                                  LoginCubit.id,
                              time: timeAgo,
                              isReplayed: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .repliedTo ==
                                  null
                                  ? true
                                  : false,
                              isReplayedName: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .repliedTo !=
                                  null
                                  ? ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .repliedTo!
                                  .sender!
                                  .username
                                  : 'null',
                              isReplayedText: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .repliedTo !=
                                  null
                                  ? ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .repliedTo!
                                  .text
                                  : 'null',
                              reactions: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .reactions,
                              media: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .media ??
                                  null,
                              index: index, MessageId: ChatCubit
                                  .get(context)
                                  .myChats[index]
                                  .id!,
                            ),
                          );
                        }))
                    : Expanded(
                  child: Center(
                      child: Text(
                        'No messages yet ...',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )),
                )
                    : Expanded(
                    child: MyLoadingIndicator(
                        height: height * .3, color: Colors.red)),
                ChatCubit
                    .get(context)
                    .repliedTo != null
                    ? Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xff480000),
                    border:
                    Border(top: BorderSide(color: Colors.grey[800]!)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.50),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ChatCubit
                                    .get(context)
                                    .repliedTo!
                                    .sender!
                                    .username!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                ChatCubit
                                    .get(context)
                                    .repliedTo!
                                    .text!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              ChatCubit.get(context).cancelReplay();
                            },
                            icon: Icon(
                              Iconsax.close_circle4,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
                    : SizedBox(),
                ChatInputField(
                  roomID: widget.roomId,
                  receiverId: widget.id,
                  isGroup: widget.isGroup,
                  participants: widget.isGroup ? widget.participants : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ChatBubble extends StatefulWidget {
  final String message;
  final bool isSentByMe;
  final String time;
  final bool isReplayed;
  final String? isReplayedName;
  final String? isReplayedText;
  final List<Reactions>? reactions;
  final List<Media>? media;
  final int index;
  final RepliedTo? repliedTo;
  final String MessageId;

  const ChatBubble({
    required this.message,
    required this.isSentByMe,
    required this.time,
    required this.isReplayed,
    this.isReplayedName,
    this.isReplayedText,
    this.reactions,
    this.media,
    required this.index,
    this.repliedTo, required this.MessageId,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  double offsetX = 0.0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              offsetX += details.delta.dx;

              if (offsetX < 0 && widget.isSentByMe == false) {
                offsetX = 0;
              }

              if (offsetX > 0 && widget.isSentByMe == true) {
                offsetX = 0;
              }
              if (offsetX <= -50 &&
                  offsetX >= -55 &&
                  widget.isSentByMe == true) {
                RepliedTo repliedMessage = RepliedTo(
                  text: widget.message,
                  sender: Sender(
                    id: LoginCubit.id,
                    username: LoginCubit.name,
                  ),
                  Id: widget.MessageId ,
                );

                print(repliedMessage);
                ChatCubit.get(context).addReplay(repliedMessage);
                print('${ChatCubit
                    .get(context)
                    .repliedTo}');
              } else if (offsetX >= 50 &&
                  offsetX <= 55 &&
                  widget.isSentByMe == false) {
                RepliedTo repliedMessage = RepliedTo(
                  text: widget.message,
                  sender: Sender(
                    id: LoginCubit.id,
                    username: LoginCubit.name,
                  ),
                  Id: widget.MessageId,
                );

                ChatCubit.get(context).addReplay(repliedMessage);
              }
            });
          },
          onHorizontalDragEnd: (details) {
            setState(() {
              offsetX = 0.0;
            });
          },
          child: Transform.translate(
            offset: Offset(offsetX, 0),
            child: Align(
              alignment: widget.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: widget.isSentByMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width * .5),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(
                              horizontal: 17.5, vertical: 12),
                          decoration: BoxDecoration(
                            color: widget.isSentByMe
                                ? Color(0xff850101)
                                : Colors.grey[800],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: widget.isSentByMe
                                  ? Radius.circular(12)
                                  : Radius.zero,
                              bottomRight: widget.isSentByMe
                                  ? Radius.zero
                                  : Radius.circular(12),
                            ),
                          ),
                          child: !widget.isReplayed
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius:
                                    BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.isReplayedName!,
                                      style: TextStyle(
                                          fontSize: width * .035,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      widget.isReplayedText!,
                                      style: TextStyle(
                                          fontSize: width * .035,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                widget.message,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * .035,
                                    fontWeight: FontWeight.w500),
                              ),
                              if (widget.media != null &&
                                  widget.media!.isNotEmpty)
                                Padding(
                                  padding:
                                  const EdgeInsets.only(bottom: 8.0),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    child: Image.network(
                                      widget.media!.first.url!,
                                      fit: BoxFit.cover,
                                      width: width * 0.5,
                                    ),
                                  ),
                                ),
                            ],
                          )
                              : Column(
                            children: [
                              Text(
                                widget.message,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * .035,
                                    fontWeight: FontWeight.w500),
                              ),
                              if (widget.media != null &&
                                  widget.media!.isNotEmpty)
                                Padding(
                                  padding:
                                  const EdgeInsets.only(bottom: 8.0),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    child: Image.network(
                                      widget.media!.first.url!,
                                      fit: BoxFit.cover,
                                      width: width * 0.5,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.reactions != null &&
                          widget.reactions!.isNotEmpty)
                        Positioned(
                          bottom: -height * .001,
                          right: widget.isSentByMe ? 5 : null,
                          left: widget.isSentByMe ? null : 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.isSentByMe
                                  ? Color(0xff850101)
                                  : Colors.grey[900],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: widget.reactions!
                                  .map(
                                    (reaction) =>
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 1.5),
                                      child: Text(
                                        reaction.emoji!,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                              )
                                  .toList(),
                            ),
                          ),
                        )
                    ],
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChatInputField extends StatefulWidget {
  final String roomID;
  final String receiverId;
  final bool isGroup;
  List<Participants>? participants;

  ChatInputField({required this.roomID,
    required this.receiverId,
    required this.isGroup,
    this.participants});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController message;

  @override
  void initState() {
    super.initState();
    message = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border(top: BorderSide(color: Colors.grey[800]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: message,
              cursorColor: Colors.red,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.grey),
            onPressed: () {
              ChatCubit.get(context).handleSendMessage(chatID: widget.roomID, receiverId: widget.receiverId);
            },
          ),
          IconButton(
            icon: Icon(Iconsax.send_1, color: Colors.red),
            onPressed: () {
              if (message.text.isNotEmpty && ChatCubit
                  .get(context)
                  .repliedTo == null) {
                ChatCubit.get(context).sendTextMessages(
                    ChatID: widget.roomID,
                    message: message.text,
                    receiverId: widget.receiverId,
                    controller: message,
                    isGroub: widget.isGroup,
                    participants: widget.isGroup ? widget.participants : null);
              }
              else if (message.text.isNotEmpty && ChatCubit
                  .get(context)
                  .repliedTo != null) {
                print(ChatCubit
                    .get(context)
                    .repliedTo!.Id!);
                ChatCubit.get(context).ReplayTextMessages(ChatID: widget.roomID,
                    message: message.text,
                    receiverId: widget.receiverId,
                    controller: message,
                    isGroub: widget.isGroup,
                    ReplyMessage: ChatCubit
                        .get(context)
                        .repliedTo!.text!,
                    ReplyMessageId: ChatCubit
                        .get(context)
                        .repliedTo!.Id!, MessageID: ChatCubit
                    .get(context).repliedTo!.Id!,);
              }
            },
          ),
        ],
      ),
    );
  }
}
