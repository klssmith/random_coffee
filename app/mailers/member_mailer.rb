class MemberMailer < ApplicationMailer
  def draw_result_email(member)
    @member = member
    template = @member.matched_member ? "draw_result_email" : "draw_result_no_match_email"

    mail(to: member.email,
         subject: "The Random Coffee draw result",
         template_name: template)
  end

  def joining_email(member)
    @member = member
    mail(to: member.email,
         subject: "You've joined the Random Coffee draw",
         template_name: "joining_email")
  end

  def leaving_email(member)
    @member = member
    mail(to: member.email,
         subject: "You have left the Random Coffee draw",
         template_name: "leaving_email")
  end
end
