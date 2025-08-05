# Skip Stripe configuration during asset precompilation
unless defined?(Rails::Console) || Rails.env.test? || File.basename($0) == 'rake'
  begin
    Stripe.api_key = ENV['STRIPE_SECRET_KEY'] || Rails.application.credentials.dig(:stripe, :secret_key)
  rescue => e
    Rails.logger.warn "Stripe configuration skipped: #{e.message}" if Rails.logger
  end
end
