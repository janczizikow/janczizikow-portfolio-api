# frozen_string_literal: true

class SubmissionMailer < ApplicationMailer
  def confirm(submission)
    @name = submission.name
    mail(to: submission.email, subject: '📧 Your email has been sent')
  end

  def notify(submission)
    @submission = submission
    mail(to: 'jan.czizikow@gmail.com', subject: '📨 New submission from janczizikow.com')
  end
end
