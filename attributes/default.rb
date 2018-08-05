#<> email address for the TYPO3 cookbook maintainers
default['email_adress'] = 'cookbooks@typo3.org'

default['postfix']['main']['inet_interfaces'] = 'all'
default['postfix']['main']['mynetworks'] = '10.0.0.0/8'

default['postfix']['main']['smtp_sasl_auth_enable'] = 'yes'
