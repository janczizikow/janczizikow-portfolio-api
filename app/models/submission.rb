# frozen_string_literal: true

class Submission < ApplicationRecord
  after_create :send_confirmation_email, :notify

  validates :name, :email, :message, presence: true
  validates_email_format_of :email

  private

  def send_confirmation_email
    SubmissionMailer.confirm(self).deliver_later
  end

  def notify
    SubmissionMailer.notify(self).deliver_later
  end
end
