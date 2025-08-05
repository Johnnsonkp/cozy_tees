# Skip Stripe configuration during asset precompilation or when dummy credentials are used
if ENV['SECRET_KEY_BASE'] == 'DUMMY' || 
   $PROGRAM_NAME.include?('assets:precompile') || 
   defined?(Rails::Console) || 
   Rails.env.test? || 
   File.basename($0) == 'rake'
  # Skip Stripe initialization
else
  begin
    Stripe.api_key = ENV['STRIPE_SECRET_KEY'] || Rails.application.credentials.dig(:stripe, :secret_key)
  rescue => e
    Rails.logger.warn "Stripe configuration skipped: #{e.message}" if Rails.logger
  end
end
