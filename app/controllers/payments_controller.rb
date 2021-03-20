class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def webhook
        payment_intent_id = params[:data][:object][:payment_intent]
        pp params[:data][:object][:charges]
        payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
        pp payment.charges
        listing_id = payment.metadata.listing_id
        buyer_id = payment.metadata.user_id

        puts "Listing: #{payment.metadata.listing_id}"
        puts "buyer: #{payment.metadata.user_id}"
        listing = Listing.find(listing_id)
        listing.purchased = true
        listing.save

        Order.create(user_id: buyer_id, listing_id: listing_id, payment_intent_id: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
        
    end

    def create_stripe_session

        @listing = Listing.find(params[:id])
        
        stripe_session = Stripe::Checkout::Session.create( 
            payment_method_types: ['card'], 
            client_reference_id: current_user ? current_user.id : nil, 
            customer_email: current_user ? current_user.email : nil, 
            line_items: [{ 
            #   amount: @listing.price * 100,
              amount: @listing.price,
              name: @listing.title, 
              description: @listing.description, 
              currency: 'aud', 
              quantity:1 
            }], 
            payment_intent_data: { 
              metadata: { 
                listing_id: @listing.id, 
                user_id: current_user ? current_user.id : nil 
              } 
            }, 
            success_url: "#{root_url}payments/success?listingId=#{@listing.id}", 
            cancel_url: "#{root_url}listings" 
          ) 
          render json: {sessionId: stripe_session.id}
    end
end
