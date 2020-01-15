class UsersController < ApplicationController

  #Certain pages are visible only to logged-in users:
  before_action :check_if_logged_in, except: [ :new, :create ]

  #Lock down admin pages
  before_action :check_if_admin, only: [ :index ]

  def new
    @user = User.new
  end

  def create
    # raise hell
    @user = User.create user_params #strong params

      if @user.persisted?
        #account created sucessfuly
        session[:user_id] = @user.id #log them in automatically!
        redirect_to user_path(@user.id)
      else
        #there was an error, so show the signup form again but we want the form to be prefilled, so let't not redirect to the login form, but just render the 'new' form template again. This way, the template can see our @user variable form above, and prefill the form

        #NOPE! Because of rendering, instead of redirecting, the flash message will live for ANOTHER page reload.
        #lets just use @user.errors in our template directly.

       #ActiveRecord has set these errors


        render :new

      end

  end

  def index
    @users = User.all
  end

  def show

    @user = User.find params[:id]

  end

  def edit
    @user = User.find params[:id]
    check_ownership
  end

  def update
    @user = User.find params[:id]
    check_ownership

    @user.update user_params

  redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation )
  end

  def check_ownership
    redirect_to login_path and return unless @current_user.present? &&  @current_user.admin?
  end

end
