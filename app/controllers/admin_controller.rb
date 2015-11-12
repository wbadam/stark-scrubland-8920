class AdminController < ApplicationController
  before_action :check_authorised


  def list_registrations
    # @owners = Owner.where({ id: Dog.where('registered_at is not null').owners })
    #owners_with_dogs = []
    #registered_dogs = Dog.where('registered_at is not null')
    #for registered_dogs.each do |d|

    # owners_with_dogs = Array.new
    # registered_dogs = Dog.where('registered_at is not null')
    # registered_dogs.each do |d|
    #     owners_with_dogs.push()
    # end
    #
    # Dog.where('registered_at is not null')

    # Owner.where({ dogs:  })

    # owners = Owner.joins(:dogs).where.not(:dogs => {:registered_at => nil})#.group(:id)

    # owners.each do |o|
    #   puts o.name
    #
    # end

    @dogs = Dog.joins(:owner).where.not(:dogs => {:registered_at => nil})

    # if dogs.size > 0
    #   last_owner = dogs.first.owner
    #   puts 'owner ' + last_owner.name
    #
    #   dogs.each do |d|
    #     if not d.owner == last_owner
    #       last_owner = d.owner
    #       puts 'owner ' + last_owner.name
    #     end
    #
    #     puts '  dog ' + d.name
    #   end
    # end


  end

  private
  def check_authorised
    # redirect_to root_path unless can? :admin, :all
    # raise ActionController::RoutingError.new('No owner')
    # raise ActionController::Error
    # render :status => :forbidden unless can? :admin, :list_registrations

    # render :status => :forbidden unless current_user.role == 'admin'
    # can?
    # render :status => :forbidden unless current_user?.role == 'admin'

    if current_user.nil? || current_user.role != 'admin'
      raise CanCan::AccessDenied.new("Not authorised!", :list_registrations)
    end

  end
end
