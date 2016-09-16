require 'csv'

class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      MemberMailer.joining_email(@member).deliver_now
      flash[:success] = "You've successfully joined Random Coffee!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    MemberMailer.leaving_email(@member).deliver_now

    if @member.user == current_user
      flash[:notice] = "You have left Random Coffee"
    else
      flash[:notice] = "#{@member.firstname} has been removed from Random Coffee"
    end

    redirect_to root_url
  end

  def email
    data = CSV.generate do |csv|
      Member.all.each do |member|
        csv << [member.email]
      end
    end

    filename = "emails.csv"
    send_data data, filename: filename
  end

private

  def member_params
    params.require(:member).permit(:firstname, :lastname, :email, :user_id)
  end
end
