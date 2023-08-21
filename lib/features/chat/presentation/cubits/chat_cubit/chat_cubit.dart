import 'package:bloc/bloc.dart';
import 'package:job_hub/features/chat/data/models/chat_models/access_chat_request.dart';
import 'package:job_hub/features/chat/data/models/chat_models/access_chat_response.dart';
import 'package:job_hub/features/chat/data/models/chat_models/get_all_chats_response.dart';
import 'package:job_hub/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepoImpl) : super(ChatInitial());

  final ChatRepoImpl _chatRepoImpl;

  Future<void> applyForJob(AccessChatRequest request) async {
    emit(ApplyForJobLoading());
    var result = await _chatRepoImpl.applyForJob(request);
    result.fold((failure) {
      emit(ApplyForJobError(errMessage: failure.errMessage));
    }, (response) {
      emit(ApplyForJobSuccess(response: response));
    });
  }

  Future<void> getAllChats() async {
    emit(GetAllChatsLoading());
    var result = await _chatRepoImpl.getAllChats();
    result.fold((failure) {
      emit(GetAllChatsError(errMessage: failure.errMessage));
    }, (response) {
      emit(GetAllChatsSuccess(response: response));
    });
  }
}
