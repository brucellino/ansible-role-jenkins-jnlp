# frozen_string_literal: true

# Molecule managed

describe file('/etc/hosts') do
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
end

# http://inspec.io/docs/reference/resources/group/
describe group('jenkins') do
  it { should exist }
  its('gid') { should eq 1000 }
end

# http://inspec.io/docs/reference/resources/user/
describe user('jenkins') do
  it { should exist }
end

# # http://inspec.io/docs/reference/resources/package/
# describe package('openjdk') do
#   it { should be_installed }
# end