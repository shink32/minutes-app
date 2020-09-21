class MeetingsController < ApplicationController
  def index
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meetings = Meeting.create(meeting_params)
    if @meetings.save
      redirect_to root_path 
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title)
  end
end
