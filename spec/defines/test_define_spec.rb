require 'spec_helper'

describe 'spec::test_define', type: :define do

  before(:each) do
    puppet_debug_override
  end

  let(:title) do
    'test'
  end

  shared_examples 'catalog' do

    context 'with default params' do
      it { is_expected.to compile.with_all_deps }

      it 'should contain a notify' do
        is_expected.to contain_notify('define_test_notify').with_message('test_define: test - message: test_message')
      end
    end

    context 'with custom params' do
      let(:params) do
        {
            :message => 'another_message',
        }
      end

      it { is_expected.to compile.with_all_deps }

      it 'should contain a notify' do
        is_expected.to contain_notify('define_test_notify').with_message('test_define: test - message: another_message')
      end
    end

  end

  on_supported_os(supported_os: supported_os).each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      include_examples 'catalog'
    end
  end

end
