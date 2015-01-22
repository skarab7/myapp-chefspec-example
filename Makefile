

# if error configure nokogirl:
# bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"
# after http://stackoverflow.com/questions/23668684/issue-installing-nokogiri-in-bundle-install
prepare_dev_env:
	bundle install

# develop
run_cookbook_rspec:
	 bundle exec rspec spec

# for jenkins integration
run_cookbook_rspec_with_junit_output:
	bundle exec rspec spec --format RspecJunitFormatter \
   --out $$(pwd)/../cookbook_rspec_results.xml
