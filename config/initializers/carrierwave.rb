CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: APP_CONFIG[:aws_access_key_id],
    aws_secret_access_key: APP_CONFIG[:aws_secret_access_key]
  }
  config.fog_directory = APP_CONFIG[:aws_s3_bucket]
end
