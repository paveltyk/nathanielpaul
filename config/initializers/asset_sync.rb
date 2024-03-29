require Rails.root.join('config', 'initializers', 'app_config.rb') unless defined?(APP_CONFIG)

if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = APP_CONFIG[:aws_s3_bucket]
    config.aws_access_key_id = APP_CONFIG[:aws_access_key_id]
    config.aws_secret_access_key = APP_CONFIG[:aws_secret_access_key]

    # To use AWS reduced redundancy storage.
    # config.aws_reduced_redundancy = true

    # Invalidate a file on a cdn after uploading files
    # config.cdn_distribution_id = "12345"
    # config.invalidate = ['file1.js']

    # Increase upload performance by configuring your region
    # config.fog_region = 'eu-west-1'
    #
    # Don't delete files from the store
    # config.existing_remote_files = "keep"
    #
    # Automatically replace files with their equivalent gzip compressed version
    # config.gzip_compression = true
    #
    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    # config.manifest = true
    #
    # Fail silently.  Useful for environments such as Heroku
    # config.fail_silently = true
  end
end
