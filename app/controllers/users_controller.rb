class UsersController < ApplicationController
  # authorizing only signed in users to edit and update
  before_filter :signed_in_user, only: [:edit, :update]
  # user can view / edit / update only his profile not others
  before_filter :correct_user, only: [:show, :edit, :update, :destroy]

  # show the profile page (get)
  def show
    @newchild = current_user.children.new
  end

  def index
    redirect_to root_url
  end

  # new user registration page (get)
  def new
    @user = User.new
  end

  # new user creation upon submit (post)
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Account has been created successfully. Welcome to ImmuCal."
      redirect_to @user
    else
      render "new"
    end
  end

  # page to edit user profile (get)
  def edit
  end

  # updating the user profile (put)
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated your profile"
      # remember_token gets reset upon every save to refresh the session
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    sign_out
    flash[:success] = "Your account has been successfully deleted."
    redirect_to root_url
  end

  private

    # redirect user unless he has signed in
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in" 
      end
    end

    # check whether the logged in user is the user being sought out
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end
