class UsersController < ApplicationController

  def show
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.email}",
     amount: Amount.default
    }
  end

  def publicize_wiki
    current_user.downgrade_account
    current_user.private_wikis(current_user).update_all(private: false)
    redirect_to user_path(current_user)
  end
end
