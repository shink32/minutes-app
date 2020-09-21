class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.create(meeting_params)
    if @meeting.save
      redirect_to root_path 
    else
      render :new
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title, user_ids:[])
  end
end
