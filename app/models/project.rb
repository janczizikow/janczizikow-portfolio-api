# frozen_string_literal: true

class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  mount_uploader :thumbnail, ThumbnailUploader

  scope :next, ->(id) { where('id > ?', id).order('id ASC') }
  scope :previous, ->(id) { where('id < ?', id).order('id DESC') }

  serialize :links, Array

  # associations
  has_many :photos, inverse_of: :project, dependent: :destroy

  accepts_nested_attributes_for :photos,
                                reject_if: proc { |attributes| attributes[:photo].blank? },
                                allow_destroy: true

  # validations
  validates :name, :slug, :description, presence: true

  def next
    Project.next(id).first
  end

  def prev
    Project.previous(id).first
  end

  private

  def slug_candidates
    [
      :name,
      %i[name date],
      %i[name date category]
    ]
  end
end
