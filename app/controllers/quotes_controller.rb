class QuotesController < ApplicationController

  before_action :authenticate_user!

  def index
    @quotes = Quote.where(user_id: current_user.id)
  end

  def search
    search_string = params[:body].strip

    if search_string.length > 0
      @quotes = Quote.where("body ilike ? AND user_id = ?", "%#{params[:body]}%", current_user.id)
    else
      redirect_to root_path
    end
  end


end
