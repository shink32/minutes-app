class ContentsController < ApplicationController
  def index
    @contents = Content.all
    @meetings = Meeting.all

    @content = Content.new
    @meeting = Meeting.find(params[:meeting_id])
  end

  def new
    @content = Content.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @content = @meeting.contents.new(contents_params)
    if @content.save
      redirect_to meeting_contents_path
    else
      redirect_to meeting_contents_path
    end
  end


  private
  def contents_params
    params.require(:content).permit(:writing).merge(user_id: current_user.id)
  end
end
