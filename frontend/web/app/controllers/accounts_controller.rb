class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  #def index
  #  @accounts = Account.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @accounts }
  #  end
  #end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    ids = params[:id].split(",")
    id = ids[0]
    product_id = ids[1]
    institution_id = ids[2]
    
    @account = Account.new
    @account.find({"id" => id, "product_id" => product_id, "institution_id" => institution_id})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  #def new
  #  @account = Account.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @account }
  #  end
  #end

  # GET /accounts/1/edit
  #def edit
  #  @account = Account.find(params[:id])
  #end

  # POST /accounts
  # POST /accounts.json
  #def create
  #  @account = Account.new(params[:account])
  #
  #  respond_to do |format|
  #    if @account.save
  #      format.html { redirect_to @account, notice: 'Account was successfully created.' }
  #      format.json { render json: @account, status: :created, location: @account }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @account.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /accounts/1
  # PUT /accounts/1.json
  #def update
  #  @account = Account.find(params[:id])
  #
  #  respond_to do |format|
  #    if @account.update_attributes(params[:account])
  #      format.html { redirect_to @account, notice: 'Account was successfully updated.' }
  #      format.json { head :ok }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @account.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  #def destroy
  #  @account = Account.find(params[:id])
  #  @account.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to accounts_url }
  #    format.json { head :ok }
  #  end
  #end
end
