class MemberMailer < ApplicationMailer
  def draw_result_email(member)
    @member = member
    mail(to: member.email,
         subject: "The Random Coffee draw result")
  end
end
