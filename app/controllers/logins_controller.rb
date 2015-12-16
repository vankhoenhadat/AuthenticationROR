class LoginsController < ApplicationController
  before_action :set_login, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /logins
  def index
    @logins = Login.all
  end

  # GET /logins/1
  def show
  end

  # GET /logins/new
  def new
    @login = Login.new
  end

  # GET /logins/1/edit
  def edit
  end

  # POST /logins
  def create
    @login = Login.new(login_params)

    if @login.save
      redirect_to @login, notice: 'Login was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /logins/1
  def update
    if @login.update(login_params)
      redirect_to @login, notice: 'Login was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /logins/1
  def destroy
    @login.destroy
    redirect_to logins_url, notice: 'Login was successfully destroyed.'
  end

  # Login region function
  def login
    a=""
  end
  def request_login
    # @url ="http://localhost:3000/bookingtests/56667fd5e1d6bc038a000000";
    @url = "http://192.168.1.63:3000/users/sign_in"
    email = params[:email]
    password = params[:password]
    @result = HTTParty.post(@url.to_str,
                            :body => { :email => email,
                                       :password => password,
                                       :subject => 'This is the screen name',
                                       :issue_type => 'Application Problem',
                                       :status => 'Open',
                                       :priority => 'Normal',
                                       :description => 'This is the description for the problem'
                            }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )
     if @result["success"]
       # redirect_to controller: 'logins', action: 'userdetail', email: "email@gmail.com" , something: 'else'
       session[:email] = @result["email"]
       session[:auth_token] = @result["auth_token"]
       redirect_to "/userdetail"
     elsif
       @err = "Login failed !"
       redirect_to "/login"
     end
  end

  def register
    b=""
  end

  def create_member
    first_name = params[:first_name]
    last_name = params[:last_name]
    first_name = params[:email]
    password = params[:password]
  end

  def userdetail
    a= ""
  end
  # End login region function

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def login_params
      params[:login]
    end
end
