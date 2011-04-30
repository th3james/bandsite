class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.role? :admin
      can :manage, :all
    else
      can :read, Post
      can :read, Song
      can :read, Photo
    end
  end
end
