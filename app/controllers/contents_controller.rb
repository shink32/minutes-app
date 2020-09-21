class ContentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @contents = Content.create(contents_params)
    if @contents.save
      redirect_to content_path
    else
      redirect_to meetings_index_path
    end
  end


  private
  def contents_params
    params.require(:content).permit(:writing)
  end
end
