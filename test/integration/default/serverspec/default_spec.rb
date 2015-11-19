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

# kallisto comes with test data. We can build an index, quantify and test the results:
# https://pachterlab.github.io/kallisto/starting.html
describe command("#{ENV['kallisto_DIR']}/kallisto index -i /tmp/transcripts.idx #{ENV['kallisto_DIR']}/test/transcripts.fasta.gz") do
  its(:exit_status) { should eq 0 }
end

describe file('/tmp/transcripts.idx') do
  it { should exist }
end

describe command("#{ENV['kallisto_DIR']}/kallisto quant -i /tmp/transcripts.idx -o /tmp/output -b 100 #{ENV['kallisto_DIR']}/test/reads_1.fastq.gz #{ENV['kallisto_DIR']}/test/reads_2.fastq.gz") do
  its(:exit_status) { should eq 0 }
end

describe file('/tmp/output') do
  it { should be_directory }
end

describe file('/tmp/output/abundance.h5') do
  it { should exist }
  its(:size) { should eq 292_456 }
end

describe file('/tmp/output/abundance.tsv') do
  it { should exist }
  it { should contain 'NR_003084' }
  it { should contain '1640' }
  it { should contain '1462.9' }
  it { should contain '0.00787013' }
  it { should contain '0.887453' }
end

describe file('/tmp/output/run_info.json') do
  it { should exist }
  it { should contain(ENV['kallisto_VERSION']) }
end
