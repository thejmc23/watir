# Summary
Web UI Tests.

* Tests are in Cucumber formatting, more info on Cucumber (https://cucumber.io/)
* Execution code is Ruby, using WATIR (Web Application Test In Ruby) to control browser actions. (https://watir.com/)

### Directory structure ###
* web_ui - containing dir
    + *env_config - deprecated*
    + features - dir of test files
        - feature_files.feature - Test files written in story cucumber format.
        - step_definitions - Ruby code files, feature files will run steps contained in these files.
        - /support - Support files, directory is loaded before each run of test.
            - /WA_Tennensee, /Waters_GA - equations and expected values for Fertility Rec processing
            - /payloads, /crop_plan_templates, /crop_record_templates - json output matching when parsing PDFs
            - /translations - language/browser related strings for testing different language expectations
            - /users .yml files - files that contain api_key credentials for each user being used in rake task
    + *site_config - deprecated*

## Getting Started
* for best results on installation process, install on MacOS, or other Linux-based OS variants

#### Prerequisites
* Ruby-based editor (Rubymine)
* make sure you have read/write access to github, and set up proper authorization
* Ruby >= 2.6.2
* RVM (Ruby Version Manager)
* Bundler (gem)
* git


#### Run Commands 
 - first change directory to web_ui _`cd web_ui`_
 - with Bundler, to run install of bundled gems _`bundle install`_

#### Gems info
_should be installed, check with command `gem list`_


* aws-sdk-s3
* cucumber >= 3.1.0
* curb
* dry-inflector
* httparty
* json
* literate_randomizer
* mail
* namey
* nokogiri
* openssl
* pdf-reader
* random-word
* rake
* rest-client
* rspec
* rspec-expectations
* retries
* selenium-webdriver
* testrail_reporting (gems.agrian.com)
* testrail-ruby
* timezone
* time_series
* typhoeus
* watir >= 6.12
* yaml

#### Browser Support
* Firefox
    + Supported through JavaScript driver, no additional drivers necessary
* Chrome
    + selenium-webdriver has replaced chrome-driver
    + should be installed from `bundle install`, if not, install with _`gem install selenium-webdriver`_
* Safari
    + Safari watir-webdriver is now integrated in the 'watir' gem

#### Environment ###
The tests can be run locally by using cucumber
example command _`cucumber features/grower.feature:19`_ where the number corresponds with the scenario line number

The tests can be run against Beta, Staging, or Live (some tests may be marked as incompatible with specific environments)

#### Environment Rake task
rake arguments

* env (*string - remote/local*)
* site (*string - beta/staging/live*)
* testrail_logging (*boolean - true/false*)
* testrail_project (*string*)
* user (*string*)

`rake test_setup[env,site,testrail_logging,testrail_project,user]`
if using zsh `rake test_setup\[env,site,testrail_logging,testrail_project,user\]`

users are available in folder _web_ui/support/users_, the login and raked user must match for hooks to work properly

*example:* `rake test_setup\[local,beta,false,'test',test_engineering]`

The rake task writes *env_config.yml*, you can also edit *env_config.yml* if you want to add custom environment variables.

#### Logging results to TestRail
Testrail is the result repository for Test Engineering. (mainly in *NG_Automation_Nightly*)

Test Result structure

* Project
    + Test Run
        - Test Case / Resul


### Running the Tests

Tests are executed using Cucumber's command line structure.

`cucumber FEATURE=feature_to_test SITE=site_to_test features\feature_file.feature `

FEATURE and SITE arguments are optional and only used for test case naming in TestRail.
If omitted, tests will still run and report.

example `cucumber FEATURE=Growers_Test SITE=Beta features\grower.feature`

#### Contribution guidelines ###

* fetch **test** through git, then rebase or merge **test** branch to local (to avoid conflicts)
* Branch your changes
* Create PR (ticket number is helpful to link in JIRA)
* Merge to **test** branch
* test is merged to **Master** monthly
