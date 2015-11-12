class RegisterController < ApplicationController
  def new
    @register = Register.new

    @dog = Dog.find(params[:id])

    # @owner = Owner.find()
  end

  def create
    @register = Register.new(params.require(:register).permit(:owner, :dog, :period))
  end
end
