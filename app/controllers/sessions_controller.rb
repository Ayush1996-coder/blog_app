class SessionsController < ApplicationController
  
  def new
    redirect_to new_user_session_path
  end

  # def create
  # 	user = User.find_by(email: params[:session][:email].downcase)
  # 	if user && user.authenticate(params[:session][:password])
  # 		log_in user
  # 		redirect_to user
  # 		else
  # 			flash.now[:danger] = "Invalid email/password"
  # 			render 'new'
  # 	end
  # end

  # def destroy
  # 	log_out
  # 	redirect_to new_user_session_path
  # end
end
