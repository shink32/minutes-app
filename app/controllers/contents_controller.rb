class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def new
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
