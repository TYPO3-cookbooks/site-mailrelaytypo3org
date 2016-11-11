control 'postfix' do
  title 'SMTP listening'
  desc '
    Check Postfix configuration
  '
  describe package('postfix') do
    it { should be_installed }
  end

  describe service('postfix') do
    # unfortunately, this does not work in docker for all processes
    it { should be_running }
  end

  describe port(25) do
    it { should be_listening }
    its('protocols') { should include 'tcp'}
    its('protocols') { should include 'tcp6'}
  end

  describe parse_config_file('/etc/postfix/main.cf') do
    its('inet_interfaces') { should include 'all'}
  end
end
