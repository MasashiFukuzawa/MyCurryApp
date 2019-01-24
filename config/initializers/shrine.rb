require "shrine"
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

# アップロードするディレクトリの指定
if Rails.env.production?
  s3_options = {
    access_key_id:     ENV['S3_ACCESS_KEY_ID'],
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET']}

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)}
else
  Shrine.storages = {
      cache: Shrine::Storage::FileSystem.new('public', prefix: 'images/uploads/cache'),
      store: Shrine::Storage::FileSystem.new('public', prefix: 'images/uploads/store')}
end

# 使用するプラグインの宣言
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms