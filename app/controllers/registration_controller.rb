class RegistrationController < ApplicationController

  # require 'mandrill'

  # skip_authorization_check
  load_and_authorize_resource

  # def new
  #   @registration = Registration.new
  #
  #   @registration_periods = RegistrationPeriod.all
  #
  #   @registration.dog = Dog.find(params[:dog_id])
  #   @registration.owner = Owner.find(params[:owner_id])
  #
  #   # @dog = Dog.find(params[:dog_id])
  # end
  #
  # def create
  #   # @registration = Registration.new(params.require(:registration).permit(:owner, :dog))
  #   # params.require
  #
  #   params.require(:period).permit(:period)
  #
  #   @registration = Registration.new
  #
  #   # todo validate
  #   @period = params[:period]
  #
  #   today = Date.today
  #
  #   @registration.registered_at = today
  #   @registration.registered_until = today + @period.to_i.months
  #
  #   @registration.dog_id=params[:dog_id]
  #   @registration.owner_id = params[:owner_id]
  #
  #   if @registration.save
  #     #redirect_to registration_confirm
  #
  #     begin
  #       require 'mandrill'
  #       mandrill = Mandrill::API.new 'fPNNeb1b9Bb5yImDcmFVoA'
  #       message = {
  #           :subject => "New registration",
  #           :from_name => "Dog Register",
  #           :text => "Msg text",
  #           :to => [
  #               {
  #                   :email => "wagadam@gmail.com",
  #                   :name => "nev"
  #               }
  #           ],
  #           :from_email => "noreply@dogregister.com"
  #       }
  #
  #       # mandrill.messages.send message
  #
  #     rescue Mandrill::Error => e
  #       # Mandrill errors are thrown as exceptions
  #       puts "A mandrill error occurred: #{e.class} - #{e.message}"
  #       # A mandrill error occurred: Mandrill::InvalidKeyError - Invalid API key
  #       raise
  #     end
  #
  #     render 'confirm'
  #   else
  #     render 'new'
  #   end
  # end

  # def confirm
  #
  # end

  def new
    @dog = Dog.find(params[:dog_id])
    @registration_periods = RegistrationPeriod.all
  end

  def create
    params.require(:period).permit(:period)

    @registration = Registration.new

    # todo validate
    @period = params[:period]

    today = Date.today

    @registration.registered_at = today
    @registration.registered_until = today + @period.to_i.months

    @registration.dog_id=params[:dog_id]
    @registration.owner_id = params[:owner_id]

    if @registration.save
      #redirect_to registration_confirm

      begin
        require 'mandrill'
        mandrill = Mandrill::API.new 'fPNNeb1b9Bb5yImDcmFVoA'
        message = {
            :subject => "New registration",
            :from_name => "Dog Register",
            :text => "Msg text",
            :to => [
                {
                    :email => "wagadam@gmail.com",
                    :name => "nev"
                }
            ],
            :from_email => "noreply@dogregister.com"
        }

          # mandrill.messages.send message

      rescue Mandrill::Error => e
        # Mandrill errors are thrown as exceptions
        puts "A mandrill error occurred: #{e.class} - #{e.message}"
        # A mandrill error occurred: Mandrill::InvalidKeyError - Invalid API key
        raise
      end

      render 'confirm'
    else
      render 'new'
    end
  end
end
