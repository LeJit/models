class BankAcctController < ApplicationController

def create
	@account = Bank_acct.new(params[:account])
	
	respond_to do |format|
		if @account.save
			format.html  { redirect_to(@account,
						  :notice => 'Account created!.') }
			format.json  { render :json => @account,
						   :status => :created, :location => @account }
		else
			format.html  { render :action => "new" }
			format.json  { render :json => @account.errors,
                    :status => :unprocessable_entity }
		end			
    end
  end
  
  def destroy
	@account = Bank_acct.find(params[:id])
	@account.destroy
 
	respond_to do |format|
		format.html { redirect_to members_url }
		format.json { head :ok }
	end
  end
  
  
  def edit
	@account = Bank_acct.find(params[:id])
  end
  
  
  def update
  @account = Bank_acct.find(params[:id])
 
  respond_to do |format|
    if @account.update_attributes(params[:account])
      format.html  { redirect_to(@account,
                    :notice => 'Account Balance was successfully updated.') }
      format.json  { render :json => {}, :status => :ok }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @account.errors,
                    :status => :unprocessable_entity }
    end
  end
end
end
