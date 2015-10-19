require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file(ENV['kallisto_DIR']) do
  it { should be_directory }
end

file_path = ENV['kallisto_DIR'] + '/kallisto'
describe file(file_path) do
  it { should be_file }
  it { should be_executable }
end

# TODO: add Building an index, Quantification and Test results: https://pachterlab.github.io/kallisto/starting.html
