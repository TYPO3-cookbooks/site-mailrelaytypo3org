name             "site-mailrelaytypo3org"
maintainer       "TYPO3 Server Admin Team"
maintainer_email "cookbooks@typo3.org"
license          "Apache 2.0"
description      "Wrapper cookbook for Postfix mailrelay"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

supports         "debian"

# base cookbook
depends          "t3-base",     "~> 0.2.0"

# TYPO3-cookbooks, pin to minor (~> 1.1.0)
depends "t3-chef-vault",     "~> 1.0.0"

# community cookbooks, pin to patchlevel (= 1.1.1)
# depends          "postfix",    "= 5.3.1"
