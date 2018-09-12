# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :project, inverse_of: :photos
  mount_uploader :photo, PhotoUploader
end
