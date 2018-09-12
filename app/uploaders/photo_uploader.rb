# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true
  process convert: 'jpg'

  version :large do
    cloudinary_transformation width: 720, crop: 'scale'
  end

  version :large_retina do
    cloudinary_transformation width: 1440, crop: 'scale'
  end

  version :medium do
    cloudinary_transformation width: 690, crop: 'scale'
  end

  version :medium_retina do
    cloudinary_transformation width: 1380, crop: 'scale'
  end

  version :small do
    cloudinary_transformation width: 510, crop: 'scale'
  end

  version :small_retina do
    cloudinary_transformation width: 1020, crop: 'scale'
  end

  version :extra_small do
    cloudinary_transformation width: 540, crop: 'scale'
  end

  version :extra_small_retina do
    cloudinary_transformation width: 1080, crop: 'scale'
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
