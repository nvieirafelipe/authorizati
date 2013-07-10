class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    case user.role
        when 'admin'
            can :manage, :all
        else
            can :read, :all
            cannot :manage, AdminUser
        end
  end
end
