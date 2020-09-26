class ContentsController < ApplicationController
  def index
    @content = Content.new
    @meeting = Meeting.find(params[:meeting_id])
    @contents = @meeting.contents.includes(:user)
    @meetings = Meeting.all
  end

  def new
    @content = Content.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @content = @meeting.contents.new(contents_params)
    if @content.save
      redirect_to meeting_contents_path(@meeting)
    else
      @contents = @meeting.contents.includes(:user)
      render :index
    end
  end


  private
  def contents_params
    params.require(:content).permit(:writing, :iamge).merge(user_id: current_user.id)
  end
end
