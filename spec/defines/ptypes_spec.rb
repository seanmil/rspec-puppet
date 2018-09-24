require 'spec_helper'

describe 'ptypes::define' do
  let(:title) { 'ptypes_test' }
  let(:params) { { :val => val } }

  context "with val => 'some_string'" do
    let(:val) { 'a string' }

    it { should compile.with_all_deps }
    it { should contain_notify('test').with_message('String') }
  end
end
