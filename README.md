# Test tracker

This is a small application to organize and document manual testing of software.

The aim is to give a tool to small teams where not everyone has a github account.

[![Build Status](https://travis-ci.org/Albin-trialbee/TestingTracker.png?branch=master)](https://travis-ci.org/Albin-trialbee/TestingTracker)

[![Code Climate](https://codeclimate.com/github/Albin-trialbee/TestingTracker/badges/gpa.svg)](https://codeclimate.com/github/Albin-trialbee/TestingTracker)

[![Test Coverage](https://codeclimate.com/github/Albin-trialbee/TestingTracker/badges/coverage.svg)](https://codeclimate.com/github/Albin-trialbee/TestingTracker)

## Usage

If there is no users in the database any attempt to login will create a user and log you in.

After that all users can create more users. There are no ownerships and no limits for any users (That's why it only is for small teams)

If you setup github access tokens issues reported in this tool will be created as github issues.

## Deploy

No configuration deployment on heroku using this button:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/Albin-trialbee/TestingTracker)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Tests

```bash
$ rspec # Will run all tests with coverage (output saved to coverage/)
# Or if you'd like to run relevant tests automatically on any file change
$ guard
```

