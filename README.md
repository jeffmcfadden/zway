# Zway

Ruby gem for interfacing with the ZWay home automation API.

[ZWay API Docs](https://zwayhomeautomation.docs.apiary.io/#reference/devices/devices-commands/send-command-to-device)

## Related Information

* [ZWay Home Automation at Github](https://github.com/Z-Wave-Me/home-automation)
* [Hardware, Apps, etc](https://z-wave.me)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zway', github: 'jeffmcfadden/zway' #Not yet on rubygems.
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zway

## Usage

    require 'zway'
    Zway.api_base = "http://192.168.0.123:8083"
    Zway.session_id = "bae87991-..."
    client = Zway::Client.new
    devices = client.devices
    device = devices.select{ |d| d.id == [your_device_id] }.first # Ex: ZWayVDev_zway_32-0-37
    client.send_command(device, 'on')
    client.send_command(device, 'off')

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jeffmcfadden/zway. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Zway project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jeffmcfadden/zway/blob/master/CODE_OF_CONDUCT.md).
