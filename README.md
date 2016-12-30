# TwitterMechanize

## Installation

```
# gem install specific_install
gem specific_install https://github.com/taiyoslime/twitter_mechanize
```

or add the following to your Gemfile :
```
gem 'twitter_mechanize', github: "taiyoslime/twitter_mechanize"
```

and then exectute `bundle`.

## Usage

```ruby

# twitter_id or email
id = "XXXXXXXXXXX"
# password
pass = "XXXXXXXXXXX"

tw = TwitterMechanize::init id,pass


tw.tweet "Hello!"
#  => tweet succeed : "Hello!" => https://twitter.com/#{twitter_id}/status/XXXXXXXXXXXXXXXXXX

```

#### CLI

```shell
$ twitter_mechanize "Hello!" --id="XXXXXXXXXXX" --pass="XXXXXXXXXXXX"
#  => tweet succeed : "Hello!" => https://twitter.com/#{twitter_id}/status/XXXXXXXXXXXXXXXXXX
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
