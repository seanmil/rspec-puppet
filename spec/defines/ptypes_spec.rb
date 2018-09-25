require 'spec_helper'

describe 'ptypes::define', :unless => Puppet.version =~ /^[34]/ do
  let(:title) { 'ptypes_test' }
  let(:params) { { :val => val } }

  context "with val => 'some_string'" do
    let(:val) { 'a string' }

    it { should compile.with_all_deps }
    it { should contain_notify('type').with_message('String') }
    it { should contain_notify('value').with_message('a string') }
  end

  context "with val => Sensitive('foo')" do
    let(:val) { Puppet::Pops::Types::PSensitiveType::Sensitive.new('foo') }

    it { should compile.with_all_deps }
    it { should contain_notify('type').with_message('Sensitive[String]') }
    it { should contain_notify('value').with_message('Sensitive [value redacted]') }
  end

  context "with val => Binary('foobar')" do
    let(:val) { Puppet::Pops::Types::PBinaryType::Binary.new('foobar') }

    it { should compile.with_all_deps }
    it { should contain_notify('type').with_message('Binary') }
    it { should contain_notify('value').with_message('Zm9vYmFy') }
  end

  context "with val => Regexp('^foo[1-9]*$')" do
    let(:val) { Regexp.new('^foo[1-9]*$') }

    it { should compile.with_all_deps }
    it { should contain_notify('type').with_message('Regexp[/^foo[1-9]*$/]') }
    it { should contain_notify('value').with_message('^foo[1-9]*$') }
  end

  context "with val => Timestamp" do
    let(:val) { Time.at(1537883350, 170446.575) }

    it { should compile.with_all_deps }
    it { should contain_notify('type').with_message('Timestamp[\'2018-09-25T13:49:10.170446592 UTC\']') }
    it { should contain_notify('value').with_message('2018-09-25T13:49:10.170446592 UTC') }
  end
end
