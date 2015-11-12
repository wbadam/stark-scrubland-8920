class OwnersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    redirect_to details_path
  end

  def show
    # @owner = Owner.find(params[:id])
    # authorize! :read, @owner
    if current_user.owner != nil
      @owner = current_user.owner
    else
      # @owner = Owner.new
      # render 'new'
      redirect_to new_details_path
    end

  end

  def new
    @owner = Owner.new
  end

  def edit
    if current_user.owner != nil
      @owner = current_user.owner
    else
      redirect_to new_details_path
    end
  end

  def create
    @owner = Owner.new(owner_params)

    # set user id
    # @owner :users_id
    # if current_user
    @owner.user = current_user
    # end

    if @owner.save
      redirect_to @owner
    else
      render 'new'
    end
  end

  def update
    @owner = current_user.owner

    if @owner.update(owner_params)
      redirect_to details_path
    else
      render 'edit'
      # redirect_to edit_details_path
    end
  end

  def destroy
    @owner = current_user.owner
    @owner.destroy

    redirect_to root_path
  end

  private
  def owner_params
    params.require(:owner).permit(:name, :postal_address, :email)
  end
end
