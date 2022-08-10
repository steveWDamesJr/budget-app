class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  load_and_authorize_resource
  before_action :authenticate_user!

  
  # GET /groups/1 or /groups/1.json
  def show
    @groups = Group.where(user_id: current_user.id)
    @purchase_groups = PurchaseGroup.all.order(created_at: :desc)
  end

  # GET /groups/new
  def new
    @groups = Group.all
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(
      user_id: group_params[:user_id],
      name: group_params[:name],
      icon: group_params[:icon]
    )

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_path(current_user.id), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
