# http_server

Reprise du script http-server.sh de strigo-init-script-libs en Ansible

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [http_server_port](#http_server_port)
  - [http_server_public](#http_server_public)
  - [http_server_user](#http_server_user)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### http_server_port

#### Default value

```YAML
http_server_port: 9997
```

### http_server_public

#### Default value

```YAML
http_server_public: '{{ ansible_user_dir }}/public'
```

### http_server_user

#### Default value

```YAML
http_server_user: '{{ ansible_user_id }}'
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
