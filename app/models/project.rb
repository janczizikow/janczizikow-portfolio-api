# frozen_string_literal: true

class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  serialize :links, Array

  validates :name, :slug, :description, presence: true

  private

  def slug_candidates
    [
      :name,
      %i[name date],
      %i[name date category]
    ]
  end
end
