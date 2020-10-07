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
    # render json:{ content: @content, user_name: @content.user.name }
    respond_to do |format|
      if @content.save
        ActionCable.server.broadcast 'content_channel', content: @content 
        format.html { redirect_to "contents#index" } 
        format.json { render 'index.json.jbuilder', status: :created, location: @content } 
        format.js 
      else
        format.html { render :new } 
        format.json { render json: @content.errors, status: :unprocessable_entity } 
      end
    end
  end

  def checked
    content = Content.find(params[:id])
    if content.checked
      content.update(checked: false)
    else
      content.update(checked: true)
    end

    item = Content.find(params[:id])
    render json: { content: item }
  end

  private

  def contents_params
    params.require(:content).permit(:writing, :image).merge(user_id: current_user.id, checked: false)
  end
end
