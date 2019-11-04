require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'manga-prospects'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/manga-prospects'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_DEFAULT_REGION'],
    # aws_access_key_id: 'AKIA3QE57KKSE3VDGM7H',
    # aws_secret_access_key: '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',
    # region: 'ap-northeast-1',
    path_style: true
  }

end