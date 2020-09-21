class ContentsController < ApplicationController
  def index
    @contents = Content.all
    @meetings = Meeting.all
  end

  def new
    @content = Content.new
  end

  def create
    @contents = Content.create(contents_params)
    if @contents.save
      redirect_to contents_path
    else
      redirect_to meetings_index_path
    end
  end


  private
  def contents_params
    params.permit(:writing)
  end
end
