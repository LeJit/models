class BidderPeriodItemController < ApplicationController

 def index
	@bidder_period_items = Bidder_period_item.all
 
	respond_to do |format|
		format.html  # index.html.erb
		format.json  { render :json => @bidder_period_items }
	end
 end
 
 def create
	@bidder_period_item = Bidder_period_item.new(params[:bidder_period_item])
	
	respond_to do |format|
		if @bidder_period_item.save
			format.html  { redirect_to(@bidder_period_item,
						  :notice => 'Bidder,Period,Item added!.') }
			format.json  { render :json => @bidder_period_item,
						   :status => :created, :location => @bidder_period_item }
		else
			format.html  { render :action => "new" }
			format.json  { render :json => @bidder_period_item.errors,
                    :status => :unprocessable_entity }
		end			
    end
  end
  
  def destroy
	@bidder_period_item = Bidding_period.find(params[:id])
	@bidder_period_item.destroy
 
	respond_to do |format|
		format.html { redirect_to members_url }
		format.json { head :ok }
	end
  end
 end
 
end