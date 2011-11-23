class SessionsController < ApplicationController
  def new
	@title = "Sign In"
  end
  
  def create
	member = Member.authenticate(params[:session][:email],
                           params[:session][:password])
	if member.nil?
		# Create an error message and re-render the signin form.
		flash.now[:error] = "Invalid email/password combination."
		@title = "Sign in"
		render 'new'
	else
		# Sign the user in and redirect to the user's show page.
		sign_in member
		redirect_back_or member
	end
  end

  def destroy
	sign_out
    redirect_to root_path
  end

end
