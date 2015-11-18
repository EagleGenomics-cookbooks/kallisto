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

describe command('which kallisto') do
  its(:exit_status) { should eq 0 }
end

describe command("#{ENV['kallisto_DIR']}/kallisto") do
  its(:stdout) { should contain(ENV['kallisto_VERSION']) }
end

# TODO: add Building an index, Quantification and Test results:
# https://pachterlab.github.io/kallisto/starting.html
