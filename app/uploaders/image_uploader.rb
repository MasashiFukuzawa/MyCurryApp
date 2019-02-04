require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :processing
  plugin :versions
  plugin :delete_raw
  plugin :validation_helpers

  process(:store) do |io, context|
    versions = {original: io}

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      versions[:large]  = pipeline.resize_to_limit!(800, 800)
      versions[:medium] = pipeline.resize_to_limit!(500, 500)
      versions[:small]  = pipeline.resize_to_limit!(300, 300)
    end

    versions
  end

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024, message: '5MBを超える画像はアップロードできません。'
    validate_mime_type_inclusion %w(image/jpeg image/png)
  end
end