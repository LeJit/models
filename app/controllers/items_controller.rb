class ItemsController < ApplicationController
  def index
	@items = Item.all
 
	respond_to do |format|
		format.html  # index.html.erb
		format.json  { render :json => @items }
	end
  end
  
  
  def new
	@auction_item = Item.new
	
	respond_to do |format|
		format.html  # addAuctionItem.html.erb
		format.json  { render :json => @auction_item }
  end
  
  
  def create
	@item = Item.new(params[:item])
	
	respond_to do |format|
		if @item.save
			format.html  { redirect_to(@item,
						  :notice => 'Item was successfully added to the auction list.') }
			format.json  { render :json => @item,
						   :status => :created, :location => @item }
		else
			format.html  { render :action => "new" }
			format.json  { render :json => @item.errors,
                    :status => :unprocessable_entity }
		end			
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
  