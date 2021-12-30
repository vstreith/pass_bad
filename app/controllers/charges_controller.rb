# app/controllers/charges_controller.rb
class ChargesController < ApplicationController
  include StripeConcern
  # ...

  def create
    # Amount in cents
    @amount = 7200

    customer = create_or_retrieve_customer(current_user)

    begin
      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur'
      )
      current_user.increment_premium
      current_user.save
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end
  end
end
