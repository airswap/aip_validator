# AIP validator

[![Gem](https://img.shields.io/gem/v/aip_validator.svg?style=flat)](http://rubygems.org/gems/aip_validator "View this project in Rubygems")

Small library to check if AIP doc has valid front matter. Original work at https://github.com/ethereum/eip_validator

## Validation rules

### Mandatory fields

- aip
- title
- author
- status
- created

### Optional fields

- discussions-to
- replaces
- requires
- review-period-end
- superseded-by
- updated

### Mandatory values

- `status` must be one of:
  - `Draft`
  - `Proposed`
  - `Approved`
  - `Implemented`
  - `Withdrawn`
  - `Deferred`
  - `Rejected`

## Prerequisite

- ruby

## Setup

```
gem install aip_validator
```

## Usage (command line)

```ruby
aip_validator INPUT_FILES
```

## Usage (as a lib)

```ruby
require 'aip_validator'

AipValidator::Runner.run
```

### Example

```
$aip_validator  ~/src/AIPs/AIPS/*[0-9].md

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
