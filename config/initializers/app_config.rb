# Admin namespace credentials
login, password  = ENV['ADMIN_CREDENTIALS'].to_s.split(':')

APP_CONFIG = {
  admin_login: login || 'admin',
  admin_password: password || 'admin',
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_s3_bucket: "nathaniel-paul-#{Rails.env}"
}
