require 'spec_helper'

describe 'quota' do
  let(:facts) { { :osfamily => 'Debian' } }
  it { should compile.with_all_deps }
  it { should contain_class('quota') }

  # Verify if required packages are installed
  it do
    should contain_package('quota')
    should contain_package('quotatool')
  end
end
