require 'spec_helper'

describe 'aliases::myfunc' do
  # used to test the fact that expected result can be a regexp
  it { should run.with_params('circle').and_return('circle') }
  it { should run.with_params('square').and_return('square') }
  it { should run.with_params('flat').and_raise_error(ArgumentError) }
end
