// TODO Implement this library.
import 'dart:async';

//未知的,已认证的,未认证的
enum AuthenticationStatus { unknown, authenticated, unauthenticated }
//将AuthenticationBloc负责对身份验证状态的变化（由 公开AuthenticationRepository）做出反应
// ，并将发出我们可以在表示层中做出反应的状态。
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}