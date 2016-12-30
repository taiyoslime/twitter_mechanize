# TwitterMechanize

## Installation

```
gem specific_install -l 'git://github.com/taiyoslime/twitter_mechanize'
```

or just clone this repository and then exectute `bundle install`.

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
