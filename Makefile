COOKBOOK_NAME="myapp-example"
VENDORED_COOKBOOKS="berks-cookbooks"

# if error configure nokogirl:
# bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"
# after http://stackoverflow.com/questions/23668684/issue-installing-nokogiri-in-bundle-install
prepare_dev_env:
	bundle install

run_cookbook_chefspec:
	# Notice: it is slow, it runs berks every time, you call rspec
	bundle exec rspec spec

run_cookbook_fast_chefspec:
	# ensure that rspec takes the most current version of myapp-example
	if [ ! -d berks-cookbooks ]; then berks vendor ; fi ; \
	rm -rf $(VENDORED_COOKBOOKS)/$(COOKBOOK_NAME) ; \
	# very fast because we do not run berks before executing rspecs
	SPEED_UP=True bundle exec rspec spec

# for jenkins integration
run_cookbook_rspec_with_junit_output:
	bundle exec rspec spec --format RspecJunitFormatter \
   --out cookbook_rspec_results.xml

# for jenkins integration
run_cookbook_foodcritic:
	bundle exec foodcritic .

# ensure that you do not push )#(@) to github
_check_rendered_readme:
	rm -f README.html; pandoc -f markdown -t html README.md > README.html
