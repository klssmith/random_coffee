class MemberMailer < ApplicationMailer
  def draw_result_email(member)
    @member = member
    template = @member.match ? "draw_result_email" : "draw_result_no_match_email"

    mail(to: member.email,
         subject: "The Random Coffee draw result",
         template_name: template)
  end
end
