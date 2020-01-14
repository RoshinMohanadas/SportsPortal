class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_back_or root_url
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def forgotpassword
    @errorpresent = true
  end

  def sendpassword
    user = User.find_by(email: params[:forgot][:email].downcase)
    @msg = ""
    @errorpresent = false
    @color = ""

    if user
      rand_string = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
      user.password = rand_string
      user.password_confirmation = rand_string

      

      if user.save
        UserMailer.changeinpassword_email(user, rand_string).deliver_now
        @msg = "Successfully generated new password. Please check your email."
      else
        @msg = "Unexpected error. Please try again later."
        @errorpresent = true
      end
    else
      @msg = "There is no account registered with this email."
      @errorpresent = true
    end

    if @errorpresent
      flash.now[:danger] = @msg # Not quite right!
    else
      flash.now[:success] = @msg
    end

    
    render 'forgotpassword'
    # redirect_to :controller => 'session', :action => 'forgotpassword'
  end

  def destroy
  	log_out
    redirect_to root_url
  end
end
