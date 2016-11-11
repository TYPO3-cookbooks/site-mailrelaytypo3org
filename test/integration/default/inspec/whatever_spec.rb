control 'postfix' do
  title 'SMTP listening'
  desc '
    Check Postfix configuration
  '
  describe package('postfix') do
    it { should be_installed }
  end

  describe port(25) do
    it { should be_listening }
    its('protocols') { should include 'tcp'}
    its('protocols') { should include 'tcp6'}
  end

  describe parse_config_file('/etc/postfix/main.cf') do
    its('inet_interfaces') { should include 'all'}
    its('mynetworks') { should include '10.0.0.0/8'}
  end
end
