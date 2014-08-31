# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rsspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separetly)
#  * 'just' rspec: 'rspec'
guard :rspec, cmd: 'bundle exec rspec -c' do
  watch(%r{^spec/(.+).rb$})
  watch(%r{^config/(.+)\.rb$})     { |m| "spec/config/#{m[1]}_spec.rb" }
  # watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('my_app.rb')               { "my_app" }
  watch('spec/spec_helper.rb')     { "spec" }
end

