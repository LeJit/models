class MembersController < ApplicationController

  def new
	@auction_item = Member.new
	@title = "Sign Up"
	
	respond_to do |format|
		format.html  # addMember.html.erb
		format.json  { render :json => @member }
  end
 
 
  def create
	@member = Member.new(params[:member])
	
	respond_to do |format|
		if @member.save
			sign_in @member
			format.html  { redirect_to(@member,
						  :notice => 'Welcome to the Tartan MarketPlace!.') }
			format.json  { render :json => @member,
						   :status => :created, :location => @member }
		else
			format.html  { render :action => "new" }
			format.json  { render :json => @member.errors,
                    :status => :unprocessable_entity }
		end			
    end
  end
  
  
  def destroy
	@member = Member.find(params[:id])
	@member.destroy
 
	respond_to do |format|
		format.html { redirect_to members_url }
		format.json { head :ok }
	end
  end
end