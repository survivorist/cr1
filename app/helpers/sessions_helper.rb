module SessionsHelper

def sign_out
		current_user = nil
		cookies.delete(:remember_token)
	end

end
