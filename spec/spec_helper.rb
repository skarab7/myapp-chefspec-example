require 'chefspec'
# MANUAL SPEED UP when you do not need to run berkshelf again.
# see: http://amespinosa.wordpress.com/2014/02/16/manual-berkshelf-caching-on-chefspec/
if not ENV['SPEED_UP']
  require 'chefspec/berkshelf'
end

RSpec.configure do |config|  
  if ENV['SPEED_UP']  	
    config.cookbook_path = %w(berks-cookbooks ..)
  end

  config.color = true
  config.tty = true
  config.order = 'random'
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
