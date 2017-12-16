CarrierWave.configure do |config|
  
  config.storage    = :aws
  config.aws_bucket = 'go2meeting-dev'
  config.aws_acl    = 'public-read'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  # config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     "AKIAIXK3XSFRYIBFNBPQ",
    secret_access_key: "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",
    region:            "us-east-2" # Required
  }

end