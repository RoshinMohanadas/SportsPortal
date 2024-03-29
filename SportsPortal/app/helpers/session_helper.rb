module SessionHelper
    def log_in(user)
    	session[:user_id] = user.id
  	end

  	# Returns the current logged-in user (if any).
    def current_user?(user)
        user == current_user
    end

  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
  	end

  	# Returns true if the user is logged in, false otherwise.
  	def logged_in?
    	!current_user.nil?
  	end

  	def log_out
    	session.delete(:user_id)
    	@current_user = nil
  end

  def event_admin?
    if logged_in?
      current_user.role.downcase == 'eventadmin'
    else
      return false
    end
  end

  def site_admin?
    if logged_in?
      current_user.role.downcase == 'siteadmin'
    else
      return false
    end
  end

  def admin?
    if logged_in?
      (current_user.role.downcase == 'eventadmin' || current_user.role.downcase == 'siteadmin') 
    else
      return false
    end
  end

  def institute?
    if logged_in?
      current_user.role.downcase == 'user'
    else
      return false
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
