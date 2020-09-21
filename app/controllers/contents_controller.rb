class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def new
    @content.new
  end

  def create
    @content = Content.create(contents_params)
    if @content.save
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
