class BiddingPeriodController < ApplicationController

 def index
	@bidding_period = Bidding_period.all
 
	respond_to do |format|
		format.html  # index.html.erb
		format.json  { render :json => @bidding_period }
	end
 end
 
 def create
	@bidding_period = Bidding_period.new(params[:bidding_period])
	
	respond_to do |format|
		if @bidding_period.save
			format.html  { redirect_to(@bidding_period,
						  :notice => 'Bidding added!.') }
			format.json  { render :json => @bidding_period,
						   :status => :created, :location => @bidding_period }
		else
			format.html  { render :action => "new" }
			format.json  { render :json => @bidding_period.errors,
                    :status => :unprocessable_entity }
		end			
    end
  end
  
  def destroy
	@bidding_period = Bidding_period.find(params[:id])
	@bidding_period.destroy
 
	respond_to do |format|
		format.html { redirect_to members_url }
		format.json { head :ok }
	end
  end
 end
end
