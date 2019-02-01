class Ability
  include CanCan::Ability

  def initialize(user)
    if user == User.first && user.admin_flg?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
