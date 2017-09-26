# Buffalo::Logs

Welcome to your new gem! 
This gem create a special log file in log/ directory with logger's level is error, fatal and unknown.
In production enviroment, every day, you can examine special_log and revise code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "buffalo-logs", "0.0.3"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install buffalo-logs

## Usage

In each other environment: development, staging, production ...
Add the configuration below and let enjoy.
```ruby
config.logger = Buffalo::Logs::Extraction.new Rails.root.join "log"
```

