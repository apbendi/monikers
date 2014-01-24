# Monikers

Monikers is a _very_ simple Gem for listing and comparing first name 'monikers', or
nicknames. If a 3rd party, web based API is overkill for your needs, but simple
string or regex comparison is not sufficient, Monikers can fill the gap.

## Installation

Add this line to your application's Gemfile:

    gem 'monikers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monikers

## Usage

	Monikers.list("Bob") 					# => ["robert", "rob", "bobby", "bert", "bob"]
	Monikers.list("Polycarp") 				# => ["polycarp"]
	Monikers.equivalents?("Sam", "Samuel")	# => true
	Monikers.equivalents?("Mike", "Matt") 	# => false

## Implementation

Monikers uses a static hash to lookup nicknames. The data structure is
pre-built, stored in a flat file (`lib/data/monikers_hash.rb`) and `eval`'d
when needed.

The nickname hash is compiled from a static list of names in CSV format
(`lib/data/monikers_list.csv`). This CSV is not accessed unless
`Monikers::Generator.generate_cache` method is called. **This should not be done
in normal use of the Gem**, such as during the execution of a routine using
Monikers. Instead, it should only be done ahead of time to add or modify
names in the hash cache. See the "Add or Modify" names section under "Contributing"
below.

## Contributing

### Add or Modify Names
To add or modify names to the Monikers cache, make the changes to the static
CSV, then run the generator on your local development machine to update the
static data structure.

	$ cd path/to/monikers
	$ cd lib/monikers/generator/
	$ irb
	> require './generator.rb'
	> Monikers::Generator.generate_cache

`lib/data/monikders_hash.rb` should have been modified to include your changes.
It is requested that if you submit a patch including new names or nicknames, that you 
write a test or two for at least some of the new names created.

Submit all changes in one commit (example: 54e49341efce2a6bcfef84c41598cf5dce48714e)
via pull request.

### Modifying Gem functionality or tests
The Monikers Gem is simple by design. Pull requests for complex changes or 
functionality may not be accepted. If you think you have a helpful addition or
correction to the Gem or its tests, use a standard fork & branch workflow:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
