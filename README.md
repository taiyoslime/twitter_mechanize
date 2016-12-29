# TwitterMechanize

## Usage

```ruby

# twitter_id or email
id = "XXXXXXXXXXX"
# password
pass = "XXXXXXXXXXX"

# Returns nil if authorization has failed.
tw = TwitterMechanize::init id,pass


# Tweet
tw.tweet "Hello!"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
