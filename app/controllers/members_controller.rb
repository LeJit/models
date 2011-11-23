class MembersController < ApplicationController

before_filter :authenticate, :only => [:edit, :update]
before_filter :correct_user, :only => [:edit, :update]

  def new
	@member = Member.new
	@title = "Sign Up"
  end
 
 
  def create
	@member = Member.new(params[:member])
	
	if @member.save
		sign_in @member
		redirect_to @member
	else
		@title = "Sign up"
		render 'new'
    end
  end
  
  
  def destroy
	@member = Member.find(params[:id])
	@member.destroy
	redirect_to root_path
  end
  
  def show
	@member = Member.find(params[:id])
	@items_sold = Item.where(:seller_id => @member.id)
	@items1 = @items_sold
	
	@items_bought = @member.items
  end
  
  def edit
    @title = "Edit member details"
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:success] = "Profile updated."
      redirect_to @member
    else
      @title = "Edit member details"
      render 'edit'
    end
  end
  
  private
	
	def correct_user
      @member = Member.find(params[:id])
      redirect_to(root_path) unless current_user?(@member)
    end
end