# Mailrelay

Accept mails from the internal network and forward them via mail.typo3.org as smarthost

## Setting up Secrets

Every mailrelay server needs an own mail account. Set this up in Mailcow and configure it to **disable sender checks**.

Storing the secret in chef-vault can be done as follows (after the host has been provisioned with _t3-base_):

- Create local file containing data bag data (`mailtypo3org-srvXXXtypo3org.json`):

```
{
  "smarthosts": {
    "mail.typo3.org": {
      "username": "mailrelay-srvXXX",
      "password": "123456"
    }
  }
}
```

- Create vault item:
```

```bash
$ knife vault create passwords-production mailtypo3org-srvXXXtypo3org --mode client --search 'fqdn:srvXXX.typo3.org' --json mailtypo3org-srvXXXtypo3org.json
```

- Optionally: Verify that the host is really added to the vault keys:
```
$ knife data bag show passwords-production  mailtypo3org-srvXXXtypo3org_keys
```

- Delete clear-text file, DO NOT COMMIT!
