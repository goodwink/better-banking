class AccountProductsController < ApplicationController
  # GET /account_products
  # GET /account_products.json
  def index
    @account_products = AccountProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_products }
    end
  end

  # GET /account_products/1
  # GET /account_products/1.json
  def show
    @account_product = AccountProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_product }
    end
  end

  # GET /account_products/new
  # GET /account_products/new.json
  def new
    @account_product = AccountProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_product }
    end
  end

  # GET /account_products/1/edit
  def edit
    @account_product = AccountProduct.find(params[:id])
  end

  # POST /account_products
  # POST /account_products.json
  def create
    @account_product = AccountProduct.new(params[:account_product])

    respond_to do |format|
      if @account_product.save
        format.html { redirect_to @account_product, notice: 'Account product was successfully created.' }
        format.json { render json: @account_product, status: :created, location: @account_product }
      else
        format.html { render action: "new" }
        format.json { render json: @account_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_products/1
  # PUT /account_products/1.json
  def update
    @account_product = AccountProduct.find(params[:id])

    respond_to do |format|
      if @account_product.update_attributes(params[:account_product])
        format.html { redirect_to @account_product, notice: 'Account product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_products/1
  # DELETE /account_products/1.json
  def destroy
    @account_product = AccountProduct.find(params[:id])
    @account_product.destroy

    respond_to do |format|
      format.html { redirect_to account_products_url }
      format.json { head :ok }
    end
  end
end
