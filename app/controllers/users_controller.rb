class UsersController < ApplicationController
  def show
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.email}",
     amount: Amount.default
    }
  end

  def premium_to_standard
    current_user.downgrade_role
    redirect_to user_path(current_user)
  end
end
