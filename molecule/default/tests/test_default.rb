# frozen_string_literal: true

# Molecule managed

describe file('/etc/hosts') do
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
end

# http://inspec.io/docs/reference/resources/package/
describe package('openjdk') do
  it { should be_installed }
end