# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview
  def draw_result_email
    member = Member.first
    MemberMailer.draw_result_email(member)
  end
end
