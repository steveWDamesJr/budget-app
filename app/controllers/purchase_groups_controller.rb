class PurchaseGroupsController < ApplicationController
  before_action :set_purchase_group, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /purchase_groups or /purchase_groups.json
  def index
    @purchase_groups = PurchaseGroup.all
  end

  # GET /purchase_groups/1 or /purchase_groups/1.json
  def show; end

  # GET /purchase_groups/new
  def new
    @purchase_group = PurchaseGroup.new
  end

  # GET /purchase_groups/1/edit
  def edit; end

  # POST /purchase_groups or /purchase_groups.json
  def create
    @purchase_group = PurchaseGroup.new(purchase_group_params)

    respond_to do |format|
      if @purchase_group.save
        format.html do
          redirect_to purchase_group_url(@purchase_group), notice: 'Purchase group was successfully created.'
        end
        format.json { render :show, status: :created, location: @purchase_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_groups/1 or /purchase_groups/1.json
  def update
    respond_to do |format|
      if @purchase_group.update(purchase_group_params)
        format.html do
          redirect_to purchase_group_url(@purchase_group), notice: 'Purchase group was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @purchase_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_groups/1 or /purchase_groups/1.json
  def destroy
    @group = Group.find(params[:group_id])
    @purchase_group.destroy

    respond_to do |format|
      format.html { redirect_to purchase_groups_url, notice: 'Purchase group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_group
    @purchase_group = PurchaseGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_group_params
    params.fetch(:purchase_group, {})
  end
end
