class SessionController < ApplicationController
  def new
  end

  def create
    #see if the email address entered actually exists in the 'users' table
    user = User.find_by email: params[:email]

    #did we find a use, and if we did, is the password correct?
    if user.present? && user.authenticate( params[:password] )
      #successful login

      #get Rails to create a new key in a special system variable called
      #'session'; this variable is remebered across requests!
      #(This persistent memory across requests is implemented using browser cookies)
      session[:user_id] = user.id

      redirect_to user_path(user.id) #go to /#users/10 (or whatever ID)

    else
      #failed login (wrong credentials)
      flash[:error] = 'Invalid email or password'
      redirect_to login_path # show the form again
    end
  end #create

  def destroy
    session[:user_id] = nil #this log out the user
    redirect_to login_path
  end
end
