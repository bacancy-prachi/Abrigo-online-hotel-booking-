class ChargesController < ApplicationController


    def new
    end
    
    def create
      # Amount in cents
      @amount = session[:total]
      @amount = @amount.to_i
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount*100,
        description: 'Rails Stripe customer',
        currency: 'inr',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
