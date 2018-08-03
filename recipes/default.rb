=begin
#<
The default recipe
#>
=end

include_recipe "t3-base"
include_recipe "postfix"

# continue with other stuff

# include_recipe "#{cookbook_name}::_logrotate"

include_recipe 't3-chef-vault'
settings = chef_vault_password('mail.typo3.org', 'mailrelaytypo3org', 'smarthosts')

edit_resource(:template, node['postfix']['sasl_password_file']) do
  variables settings: settings
end
