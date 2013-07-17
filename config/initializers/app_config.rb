login, password  = ENV['ADMIN_CREDENTIALS'].to_s.split(':')

APP_CONFIG = {
  admin_login: login || 'admin',
  admin_password: password || 'admin'
}
