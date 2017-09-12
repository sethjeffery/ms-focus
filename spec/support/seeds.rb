module LoadSeeds
  def load_seeds
    load "#{Rails.root}/db/seeds.rb"
  end
end

RSpec.configure do |config|
  config.include LoadSeeds
end
