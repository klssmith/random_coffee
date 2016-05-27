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
      redirect_to '/members'
    else
      render 'new'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "You have been removed successfully"
    redirect_to '/members'
  end

private

  def member_params
    params.require(:member).permit(:firstname, :lastname, :email)
  end
end
