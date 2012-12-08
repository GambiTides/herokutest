class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    @json = User.all.to_gmaps4rails
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    if params[:id].nil? && current_user
      @user = current_user
    else 
      authorize! :index, @user, :message => 'Not authorized as an administrator.'  
      @user = User.find(params[:id])
    end
    @json = User.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  
  def map
    @users = User.all
    @json = User.all.to_gmaps4rails
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
   def clinic
    user = current_user
    @client = GooglePlaces::Client.new('AIzaSyAVxxDByY6qduaq1UTgUq9WlUZ40FkmlKw')
    @spotList = @client.spots(user.latitude, user.longitude, :radius => "5000", :types => 'doctor', :exclude => 'dentist')
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end