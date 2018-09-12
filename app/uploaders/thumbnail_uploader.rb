# frozen_string_literal: true

class ThumbnailUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true
  process convert: 'jpg'

  version :big do
    resize_to_fit 570, 570
  end

  version :big_retina do
    resize_to_fit 1140, 1140
  end

  version :small do
    resize_to_fit 275, 275
  end

  version :small_retina do
    resize_to_fit 550, 550
  end

  version :big_placeholder do
    resize_to_fit 400, 400
  end

  version :small_placeholder do
    resize_to_fit 100, 100
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
