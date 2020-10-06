class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy
    redirect_to root_path
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def checked
    content = Content.find(params[:id])
    if content.checked
      content.update(checked: false)
    else
      content.update(checked: true)
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :content, :time, user_ids: [])
  end

end
