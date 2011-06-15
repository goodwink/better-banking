class AccountSubtypesController < ApplicationController
  # GET /account_subtypes
  # GET /account_subtypes.json
  def index
    @account_subtypes = AccountSubtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_subtypes }
    end
  end

  # GET /account_subtypes/1
  # GET /account_subtypes/1.json
  def show
    @account_subtype = AccountSubtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_subtype }
    end
  end

  # GET /account_subtypes/new
  # GET /account_subtypes/new.json
  def new
    @account_subtype = AccountSubtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_subtype }
    end
  end

  # GET /account_subtypes/1/edit
  def edit
    @account_subtype = AccountSubtype.find(params[:id])
  end

  # POST /account_subtypes
  # POST /account_subtypes.json
  def create
    @account_subtype = AccountSubtype.new(params[:account_subtype])

    respond_to do |format|
      if @account_subtype.save
        format.html { redirect_to @account_subtype, notice: 'Account subtype was successfully created.' }
        format.json { render json: @account_subtype, status: :created, location: @account_subtype }
      else
        format.html { render action: "new" }
        format.json { render json: @account_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_subtypes/1
  # PUT /account_subtypes/1.json
  def update
    @account_subtype = AccountSubtype.find(params[:id])

    respond_to do |format|
      if @account_subtype.update_attributes(params[:account_subtype])
        format.html { redirect_to @account_subtype, notice: 'Account subtype was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_subtypes/1
  # DELETE /account_subtypes/1.json
  def destroy
    @account_subtype = AccountSubtype.find(params[:id])
    @account_subtype.destroy

    respond_to do |format|
      format.html { redirect_to account_subtypes_url }
      format.json { head :ok }
    end
  end
end
