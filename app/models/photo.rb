# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :project
  mount_uploader :photo, PhotoUploader
end
