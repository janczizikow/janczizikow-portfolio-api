# frozen_string_literal: true

module EmailConfirmable
  extend ActiveSupport::Concern

  included do
    after_create :send_confirmation_email, :notify
  end

  private

  def send_confirmation_email
    SubmissionMailer.confirm(self).deliver_now
  end

  def notify
    SubmissionMailer.notify(self).deliver_now
  end
end
