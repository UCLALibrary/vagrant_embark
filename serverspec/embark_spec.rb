require 'spec_helper'

describe 'embark' do
    # include all the shared_examples
    include_examples 'database::init'
    include_examples 'proxy::init'
    include_examples 'fedora::init'
    include_examples 'solr::init'
    include_examples 'railsapp::init'

    # the host name should be set to embark.vagrant.test
    describe host('embark.vagrant.test') do
      it { should be_resolvable }
    end

    # SELinux should be disabled
    describe selinux do
      it { should be_disabled }
    end

    # TODO verify command outputs

end
