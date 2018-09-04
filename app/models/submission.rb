# frozen_string_literal: true

class Submission < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates_email_format_of :email
end
