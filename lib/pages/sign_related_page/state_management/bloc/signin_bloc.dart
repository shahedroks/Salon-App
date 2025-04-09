import 'package:bloc/bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc()
    : super(
        SigninState(
          isObscureText: false,
          isVisibleIconShow: false,
          isPasswordVisible: false,
        ),
      ) {
    on<OnPasswordVisibleEvent>((event, emit) {
      var _passwordVisibleCopy = state.isPasswordVisible;
      var _ObscureTextCopy = state.isObscureText;
      _passwordVisibleCopy = !_passwordVisibleCopy;
      _ObscureTextCopy = !_ObscureTextCopy;
      print("onPasswordVisible is all right");

      emit(
        SigninState(
          isPasswordVisible: _passwordVisibleCopy,
          isVisibleIconShow: false,
          isObscureText: _ObscureTextCopy,
        ),
      );
    });
  }
}
