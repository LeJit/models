class PagesController < ApplicationController
  def home
	@title = "Home"
    @item = Item.new if signed_in?
  end

end
