module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
		@current_user = user
	end

	def current_user
		@current_user ||= User.find(session[:user_id])
	end

	def logged_in?
		!@current_user.nil?
	end

	def is_mfr?
		current_user.mfr
	end
	def logout
		@current_user = nil
		session[:user_id] = nil
	end
end