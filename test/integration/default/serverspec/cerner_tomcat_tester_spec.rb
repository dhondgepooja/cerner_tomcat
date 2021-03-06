# coding: UTF-8

require 'spec_helper'

describe user('my_user') do
  it { should exist }
  it { should belong_to_group 'my_group' }
end

describe service('my_tomcat') do
  it { should be_running   }
end

# There should only be 1 java process running
describe process('java') do
  its(:user) { should eq 'my_user' }
  its(:args) { should match /-Xms512m -Xmx512m -XX:PermSize=384m -XX:MaxPermSize=384m/ }
end

describe file('/opt/my_dir/my_tomcat/my_file') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_dir/my_tomcat/my_remote_file') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_dir/my_tomcat/my_template') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
  it { should contain 'tomcat_my_template' }
end

describe file('/opt/my_dir/my_tomcat/webapps/my_webapp') do
  it { should be_directory }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_dir/my_tomcat/webapps/my_webapp.war') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_dir/my_tomcat/webapps/my_webapp/my_file') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_dir/my_tomcat/webapps/my_webapp/my_remote_file') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_dir/my_tomcat/webapps/my_webapp/my_template') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
  it { should contain 'web_app_template' }
end

describe file('/opt/my_logs') do
  it { should be_directory }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/opt/my_logs/my_tomcat') do
  it { should be_symlink }
  it { should be_linked_to '/opt/my_dir/my_tomcat/logs' }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
end

describe file('/etc/logrotate.d/tomcat-my_tomcat') do
  it { should contain '"/opt/my_logs/my_tomcat/*.out" "/opt/my_logs/my_tomcat/*.log" {' }
  it { should contain 'rotate 1' }
  it { should contain 'maxsize 100M' }
  it { should contain 'size 10M' }
  it { should contain 'daily' }
  it { should contain 'compress' }
  it { should contain 'copytruncate' }
end

describe file('/etc/init.d/tomcat_my_tomcat') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain '# Thing: Value' }
  it { should contain '# Default-Start: 1 2 3 4 5' }
  it { should contain '# Provides: my_tomcat' }
  it { should contain '# Default-Stop: 0 1 2 6' }
end

describe file('/opt/my_dir/my_tomcat/bin/setenv.sh') do
  it { should be_file }
  it { should be_owned_by 'my_user' }
  it { should be_grouped_into 'my_group' }
  it { should contain 'export TEST_VAR=TEST_VALUE' }
end
