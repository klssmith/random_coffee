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
      flash[:success] = "You've successfully joined Random Coffee!"
      redirect_to matches_url
    else
      render 'new'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    if @member.user == current_user
      flash[:notice] = "You have left Random Coffee"
    else
      flash[:notice] = "#{@member.firstname} has been removed from Random Coffee"
    end
    
    redirect_to matches_url
  end

private

  def member_params
    params.require(:member).permit(:firstname, :lastname, :email, :user_id)
  end
end
