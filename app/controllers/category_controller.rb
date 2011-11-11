class CategoryController < ApplicationController

 def index
	@categories = Category.all
 
	respond_to do |format|
		format.html  # index.html.erb
		format.json  { render :json => @categories }
	end
 end
  
 def new
	@category = Category.new
	
	respond_to do |format|
		format.html  # addCategory.html.erb
		format.json  { render :json => @category }
  end
 
 
  def create
	@category = Category.new(params[:category])
	
	respond_to do |format|
		if @category.save
			format.html  { redirect_to(@member,
						  :notice => 'Category added!.') }
			format.json  { render :json => @category,
						   :status => :created, :location => @category }
		else
			format.html  { render :action => "new" }
			format.json  { render :json => @category.errors,
                    :status => :unprocessable_entity }
		end			
    end
  end
  
  
  def destroy
	@category = Category.find(params[:id])
	@category.destroy
 
	respond_to do |format|
		format.html { redirect_to members_url }
		format.json { head :ok }
	end
  end
 end
 
 
 def edit
	@category = Category.find(params[:id])
  end
  
  
  def update
  @category = Category.find(params[:id])
 
  respond_to do |format|
    if @category.update_attributes(params[:category])
      format.html  { redirect_to(@category,
                    :notice => 'Category was successfully updated.') }
      format.json  { render :json => {}, :status => :ok }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @account.errors,
                    :status => :unprocessable_entity }
    end
  end
 end
end
