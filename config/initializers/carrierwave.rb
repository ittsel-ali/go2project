CarrierWave.configure do |config|
  
  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => 'AKIAJ4Q34IP3HOS6GWSQ',            # required
    :aws_secret_access_key  => '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',     # required
    :region                 => 'us-east-2'                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'go2meeting-dev'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.fog_provider = 'fog/aws'
  # Use local storage if in development or test
end