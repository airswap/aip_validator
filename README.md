# AIP validator

[![Gem](https://img.shields.io/gem/v/airswap_aip_validator.svg?style=flat)](http://rubygems.org/gems/airswap_aip_validator "View this project in Rubygems")

Small library to check if AIP doc has valid front matter. Original work at https://github.com/ethereum/eip_validator

## Validation rules

### Mandatory fields

- aip
- title
- status
- author
- created
- discussions-to

### Optional fields

- replaces
- requires
- review-period-end
- superseded-by
- updated

### Mandatory values

- `status` must be one of:
  - `WIP`
  - `Proposed`
  - `Approved`
  - `Implemented`
  - `Withdrawn`
  - `Deferred`
  - `Rejected`
  - `Moribund`

## Prerequisite

- ruby

## Setup

```
gem install airswap_aip_validator
```

## Usage (command line)

```ruby
airswap_aip_validator INPUT_FILES
```

## Usage (as a lib)

```ruby
require 'airswap_aip_validator'

AipValidator::Runner.run
```

### Example

```
$airswap_aip_validator  ~/src/AIPs/AIPS/*[0-9].md

total:1, valid:1, invalid:0, errors:0
	statuses: [["Implemented", 1]]

```

## Running tests

```
bundle exec rspec
```

## Releasing new gem

```
gem bump --version patch|minor|major
bundle exec rake release
```
