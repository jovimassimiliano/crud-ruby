class SuggestionsController < ApplicationController
  before_action :set_suggestion, only:[:edit,:show,:destroy,:update]

  def home

  end

  def index
    @suggestions = Suggestion.all
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    # render plain: params[:suggestion].inspect
    @suggestion = Suggestion.new (suggestion_params)
  
    if @suggestion.save
      flash[:success] = "Successfully created..."
      redirect_to suggestion_path(@suggestion)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @suggestion.update(suggestion_params)
      flash[:success] = "Successfully updated..."
      redirect_to suggestion_path(@suggestion)
    else
      render "edit"
    end
  end

  def show

  end

  def destroy
    @suggestion.destroy
    flash[:danger] = "Successfully deleted..."

    redirect_to suggestions_path
  end

  private
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:title,:description)
  end
end
