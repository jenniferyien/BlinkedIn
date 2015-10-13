class SkillMatchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.skill_match_mailer.new_match.subject
  #
  def new_match(match)
    @alumni = match
    @alumniSkillsId = []
    match.skills.each do |skill|
      @alumniSkillsId.push(skill.id)
    end #match skills
    @employersEmail = []
    @employers = Employer.all
    @employers.each do |employer|
      @match = []
      employer.skills.each do |skill|
        if @alumniSkillsId.include?(skill.id)
          @match.push(true)
        end #alumniSkillID
      end #employer.skills
      if @match.include?(true)
        @employersEmail.push(employer.user.email)
      end #@match
    end #@employers
    mail to: @employersEmail,
        subject: "Alumni Match"
  end
end
