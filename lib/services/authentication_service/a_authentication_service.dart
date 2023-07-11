abstract class AAuthenticationService {
  void getCurrentUser();
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
}
