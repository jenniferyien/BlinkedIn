require "rails_helper"

RSpec.describe SkillMatchMailer, type: :mailer do
  describe "new_match" do
    let(:mail) { SkillMatchMailer.new_match }

    it "renders the headers" do
      expect(mail.subject).to eq("New match")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
