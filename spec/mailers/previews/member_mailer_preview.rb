# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview
  def draw_result_email
    member = Member.first
    MemberMailer.draw_result_email(member)
  end

  def joining_email
    member = Member.create(firstname: "Katie", lastname: "Smith", email: "me@example.com")
    MemberMailer.joining_email(member)
  end
end
