# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubmissionMailer, type: :mailer do
  describe 'confirm' do
    let(:submission) { create(:submission) }
    let(:mail) { SubmissionMailer.confirm(submission) }

    it 'renders the headers' do
      expect(mail.subject).to eq('📧 Your email has been sent')
      expect(mail.to).to eq([submission.email])
      expect(mail.from).to eq(['jan.czizikow@gmail.com'])
    end

    pending "figure out how to test mail body with fixtures! #{__FILE__}"
    # it 'renders the body' do
    #   expect(mail.body.to_s).to match(read_fixture('confirm').join)
    # end
  end

  describe 'notify' do
    let(:submission) { create(:submission) }
    let(:mail) { SubmissionMailer.notify(submission) }

    it 'renders the headers' do
      expect(mail.subject).to eq('📨 New submission from janczizikow.com')
      expect(mail.to).to eq(['jan.czizikow@gmail.com'])
      expect(mail.from).to eq(['jan.czizikow@gmail.com'])
    end

    pending "figure out how to test mail body with fixtures! #{__FILE__}"
    # it 'renders the body' do
    #   expect(mail.body.encoded).to match('Hi')
    # end
  end
end
