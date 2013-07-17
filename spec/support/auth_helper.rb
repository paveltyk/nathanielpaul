module AuthHelper
  def http_login
    username = APP_CONFIG[:admin_login]
    password = APP_CONFIG[:admin_password]
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
