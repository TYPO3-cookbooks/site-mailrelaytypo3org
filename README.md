# Description

# Mailrelay

Accept mails from the internal network and forward them via mail.typo3.org as smarthost

# Requirements

## Platform:

* debian

## Cookbooks:

* t3-base (~> 0.2.0)
* t3-chef-vault (~> 1.0.0)
* #<Logger:0x00007fd4de443468> () (Recommended but not required)
* #<Logger:0x00007fd4de443468> () (Suggested but not required)
* Conflicts with #<Logger:0x00007fd4de443468> ()

# Attributes

* `node['email_adress']` - email address for the TYPO3 cookbook maintainers. Defaults to `cookbooks@typo3.org`.
* `node['postfix']['main']['inet_interfaces']` -  Defaults to `all`.
* `node['postfix']['main']['mynetworks']` -  Defaults to `10.0.0.0/8`.
* `node['postfix']['main']['smtp_sasl_auth_enable']` -  Defaults to `yes`.

# Recipes

* [site-mailrelaytypo3org::default](#site-mailrelaytypo3orgdefault)

## site-mailrelaytypo3org::default

The default recipe

Build Status
------------

Build status on our [CI server](https://chef-ci.typo3.org):

- *master* (release): [![Build Status master branch](https://chef-ci.typo3.org/job/TYPO3-cookbooks/job/site-mailrelaytypo3org/branch/master/badge/icon)](https://chef-ci.typo3.org/job/TYPO3-cookbooks/job/site-mailrelaytypo3org/branch/master/)


## Setting up Secrets

Every mailrelay server needs an own mail account. Set this up in Mailcow and configure it to **disable sender checks**.

Storing the secret in chef-vault can be done as follows (after the host has been provisioned with _t3-base_):

- Create local file containing data bag data (`mailtypo3org-srvXXXtypo3org.json`):

```json
{
  "smarthosts": {
    "mail.typo3.org": {
      "username": "mailrelay-srvXXX@typo3.org",
      "password": "123456"
    }
  }
}
```

- Create vault item:

```bash
$ knife vault create passwords-production mailtypo3org-srvXXXtypo3org --mode client --search 'fqdn:srvXXX.typo3.org' --json mailtypo3org-srvXXXtypo3org.json
```

- Optionally: Verify that the host is really added to the vault keys:

```bash
$ knife data bag show passwords-production  mailtypo3org-srvXXXtypo3org_keys
```

- Delete clear-text file, DO NOT COMMIT!


# License and Maintainer

Maintainer:: TYPO3 Server Admin Team (<cookbooks@typo3.org>)



License:: Apache 2.0
