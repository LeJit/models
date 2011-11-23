class ItemsController < ApplicationController
before_filter :authenticate, :only=>[:create, :destroy]

  def index
	@items1 = Item.where(:category_name => params[:category_name])
	@items_found = @items1
	render 
  end
  
  
  def new
	@auction_item = Item.new
	
	respond_to do |format|
		format.html  # addAuctionItem.html.erb
		format.json  { render :json => @auction_item }
    end
  end
  
  
  def create
    @item  = current_member.items.build(params[:item])
	@item.seller_id = current_member.id
	@item.status = 1
	@item.category_name = 'Electronics'
	@item.buyer_id = 0
    if @item.save
      flash[:success] = "Item up for auction !"
      redirect_to current_member
    else
      render 'pages/home'
    end
  end
  
  
  def show
	@item = Item.find(params[:id])
 
	respond_to do |format|
		format.html  # show.html.erb
		format.json  { render :json => @item }
	end
  end
  
  
  def destroy
	@item = Item.find(params[:id])
	@item.destroy
 
	respond_to do |format|
		format.html { redirect_to items_url }
		format.json { head :ok }
	end
  end
end
  