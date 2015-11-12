class DogsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @dogs = Dog.where(:user_id => current_user.id)



    # @dogs = current_user.dogs
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)

    @dog.user = current_user
    @dog.owner = current_user.owner

    if @dog.save
      redirect_to @dog
    else
      render 'new'
    end
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      redirect_to @dog
    else
      render 'edit'
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy

    redirect_to dogs_path
  end

  def start_registration
    @dog = Dog.find(params[:id])

    if @dog.owner.nil?
      raise ActionController::RoutingError.new('No owner')
    end

    @registration_periods = RegistrationPeriod.all
  end

  def register
    @dog = Dog.find(params[:id])

    if @dog.owner.nil?
      raise ActionController::RoutingError.new('No owner')
    end

    @dog.registered_at = Date.today
    # @dog.

    if @dog.update(register_params)
      @fee = RegistrationPeriod.find_by_length(@dog.period).cost
      @bank_account = BankAccount.first.account_number
      send_email_confirmation(@dog, @dog.owner, @fee, @bank_account)
      render 'confirm_registration'
    else
      @registration_periods = RegistrationPeriod.all
        render 'start_registration'
    end

  end

  private
  def dog_params
    params.require(:dog).permit(:name, :breed, :date_of_birth)
  end

  def register_params
    params.require(:dog).permit(:period)
  end

  def send_email_confirmation(dog, owner, fee, bank_account)
    begin
      require 'mandrill'
      mandrill = Mandrill::API.new 'fPNNeb1b9Bb5yImDcmFVoA'
      message = {
          :subject => 'Successful registration',
          :from_name => 'Dog Register',
          :text => 'Hi ' + owner.name + ",\n\n" + 'You have successfully registered your dog named ' + dog.name +
              ' (breed: ' + dog.breed + ', born on ' + dog.date_of_birth.strftime('%d/%m/%Y') +
              ') for the next ' + dog.period.to_s + ' months.' + ' The registration will expire on ' +
              (dog.registered_at + dog.period.to_i.months).strftime('%d/%m/%Y') + ".\n\n" +
              'Please transfer ' + fee.to_s + ' onto the following bank account: ' + bank_account + ".\n\n" +
              "Sincerely,\nDog Register",
          :to => [
              {
                  :email => 'wagadam@gmail.com',
                  :name => owner.name
              }
          ],
          :from_email => 'noreply@dogregister.com'
      }

      mandrill.messages.send message

    rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.message}"
      # A mandrill error occurred: Mandrill::InvalidKeyError - Invalid API key
      raise
    end
  end
end
