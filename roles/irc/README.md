# irc

Configuration IRC

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [irc_ansible_action](#irc_ansible_action)
  - [irc_packages](#irc_packages)
  - [irc_service](#irc_service)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### irc_ansible_action

#### Default value

```YAML
irc_ansible_action: converge
```

### irc_packages

#### Default value

```YAML
irc_packages:
  - ngircd
  - irssi
```

### irc_service

#### Default value

```YAML
irc_service: ngircd.service
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
