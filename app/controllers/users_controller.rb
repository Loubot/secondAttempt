class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :find_user, :only => [:show, :edit, :update, :destroy,:index]
  before_filter :check_login, :only => [:new]

  def find_user
    @user = User.find_by_id(params[:id])
    
  end

  def check_login
    if logged_in != nil
      @user = current_user
      redirect_to @user
    end
  end 

  
  def index
    
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @microposts = @user.microposts
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
      
    end
  end

  # GET /users/1/edit
  def edit
    @user 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'User created'
      redirect_to @user
    else
      flash[:error] = 'Ballbag'
      render 'new'
    end
    
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user 
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
