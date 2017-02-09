RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before :each do
    DatabaseCleaner.start
    FactoryGirl.reload
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
