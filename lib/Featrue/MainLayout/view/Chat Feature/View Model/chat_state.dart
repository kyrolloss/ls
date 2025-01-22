part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class CancelReplay extends ChatState {}
final class AddReplay extends ChatState {}


final class GetHomeChatLoading extends ChatState {}
final class GetHomeChatSuccess extends ChatState {}
final class GetHomeChatError  extends ChatState {}

final class GetSpecificChatMessagesLoading extends ChatState {}
final class GetSpecificChatMessagesSuccess extends ChatState {}
final class GetSpecificChatMessagesError  extends ChatState {}


final class SendMessageLoading extends ChatState {}
final class AddImageToChat extends ChatState {}
final class AddMessageToChat extends ChatState {}
final class SendMessageSuccess extends ChatState {}
final class SendMessageError  extends ChatState {}

final class AddReactionToMessageLoading extends ChatState {}
final class AddReactionToMessageSuccess extends ChatState {}
final class ChangeReactionId extends ChatState {}
final class AddReactionToMessageError  extends ChatState {}
