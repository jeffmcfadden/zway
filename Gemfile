source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in zway.gemspec
gemspec

# Some of the data I was getting back would fail to output in IRB with reline 0.1.7
gem 'reline', '= 0.1.6'
gem 'irb', require: false