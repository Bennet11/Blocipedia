class UsersController < ApplicationController
  def show
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.email}",
     amount: Amount.default
    }
  end

  private

  def premium_to_standard
    current_user.downgrade_role
    current_user.private_wikis_to_public
    redirect_to user_path(current_user)
  end

  def private_wikis_to_public
    Wiki.private_wikis(current_user).update(private: false)
  end
end
