class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.includes(:user).where(user: current_user)
  end

  # GET /purchases/1 or /purchases/1.json
  def show
    @purchase = Purchase.includes(:user).find(params[:id])
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(
      name: purchase_params[:name],
      amount: purchase_params[:amount],
      user_id: current_user.id
    )

    respond_to do |format|
      if @purchase.save
        save_purchase_group(@purchase)
        format.html do
          redirect_to user_group_path(current_user.id, purchase_params[:group_id]),
                      notice: 'Purchase was successfully created.'
        end

        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def save_purchase_group(purchase)
    @purchase_group = PurchaseGroup.create!(
      purchase_id: purchase.id,
      group_id: purchase_params[:group_id]
    )
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount, :group_id)
  end
end
