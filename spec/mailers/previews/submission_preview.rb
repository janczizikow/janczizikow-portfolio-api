# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/submission

class SubmissionPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/submission/confirm
  def confirm
    SubmissionMailer.confirm
  end

  # Preview this email at http://localhost:3000/rails/mailers/submission/notify
  def notify
    SubmissionMailer.notify
  end
end
