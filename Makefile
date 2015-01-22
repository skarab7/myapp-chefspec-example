COOKBOOK_NAME="myapp-example"
VENDORED_COOKBOOKS="berks-cookbooks"

# if error configure nokogirl:
# bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"
# after http://stackoverflow.com/questions/23668684/issue-installing-nokogiri-in-bundle-install
prepare_dev_env:
	bundle install

# develop
run_cookbook_rspec:
	 bundle exec rspec spec

run_cookbook_fast_rspec:
	# ensure that rspec takes the most current version of myapp-example
	# cookbook
	rm -rf $(VENDORED_COOKBOOKS)/$(COOKBOOK_NAME) ; \
	SPEED_UP=True bundle exec rspec spec

# for jenkins integration
run_cookbook_rspec_with_junit_output:
	bundle exec rspec spec --format RspecJunitFormatter \
   --out cookbook_rspec_results.xml

_check_rendered_readme:
	rm -f README.html; pandoc -f markdown -t html README.md > README.html
