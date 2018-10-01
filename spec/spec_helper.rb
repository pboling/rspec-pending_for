# NOTE: Have to use __FILE__ until Ruby 1.x support is dropped
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'rspec/pending_for'
