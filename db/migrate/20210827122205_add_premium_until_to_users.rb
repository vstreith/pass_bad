class AddPremiumUntilToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :premium_until, :date
  end
  def up
  premium_until_offer = DateTime.now + 1.month
  User.all.each { |user| user.update! premium_until: premium_until_offer }
  end
end
