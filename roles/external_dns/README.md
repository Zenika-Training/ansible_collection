# external_dns

Deploy ExternalDNS on OpenShift to auto-create DNS records from Gateway API resources via RFC2136 (BIND9)

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [external_dns_domain_filter](#external_dns_domain_filter)
  - [external_dns_image](#external_dns_image)
  - [external_dns_kubeconfig](#external_dns_kubeconfig)
  - [external_dns_log_level](#external_dns_log_level)
  - [external_dns_namespace](#external_dns_namespace)
  - [external_dns_rfc2136_host](#external_dns_rfc2136_host)
  - [external_dns_rfc2136_port](#external_dns_rfc2136_port)
  - [external_dns_rfc2136_tsig_alg](#external_dns_rfc2136_tsig_alg)
  - [external_dns_rfc2136_tsig_keyname](#external_dns_rfc2136_tsig_keyname)
  - [external_dns_rfc2136_zone](#external_dns_rfc2136_zone)
  - [external_dns_service_account](#external_dns_service_account)
  - [external_dns_tsig_secret_name](#external_dns_tsig_secret_name)
  - [external_dns_tsig_source_namespace](#external_dns_tsig_source_namespace)
  - [external_dns_tsig_source_secret_name](#external_dns_tsig_source_secret_name)
  - [external_dns_txt_owner_id](#external_dns_txt_owner_id)
  - [external_dns_wait_delay](#external_dns_wait_delay)
  - [external_dns_wait_retries](#external_dns_wait_retries)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### external_dns_domain_filter

Restrict ExternalDNS to records within this DNS zone.
Must match external_dns_rfc2136_zone.

#### Default value

```YAML
external_dns_domain_filter: "{{ bind_dns_zone_name | default('') }}"
```

### external_dns_image

Container image for ExternalDNS.

#### Default value

```YAML
external_dns_image: registry.k8s.io/external-dns/external-dns:v0.15.0
```

### external_dns_kubeconfig

Path to the kubeconfig file of the target cluster on the Ansible controller.
Falls back to ~/.kube/config if the file does not exist.

#### Default value

```YAML
external_dns_kubeconfig: /tmp/openshift/{{ inventory_hostname }}/{{ 
  inventory_hostname }}/auth/kubeconfig
```

### external_dns_log_level

Log level for ExternalDNS (debug, info, warning, error).

#### Default value

```YAML
external_dns_log_level: info
```

### external_dns_namespace

Namespace where ExternalDNS is deployed.

#### Default value

```YAML
external_dns_namespace: external-dns
```

### external_dns_rfc2136_host

IP address of the BIND9 DNS server reachable from the cluster.
Should match bind_dns_lb_ip (the MetalLB LoadBalancer IP of the DNS service).
REQUIRED – set in host_vars alongside bind_dns_lb_ip.

#### Default value

```YAML
external_dns_rfc2136_host: "{{ bind_dns_lb_ip | default('') }}"
```

### external_dns_rfc2136_port

DNS port on the BIND9 server.

#### Default value

```YAML
external_dns_rfc2136_port: 53
```

### external_dns_rfc2136_tsig_alg

TSIG algorithm (must match the one used in BIND9).

#### Default value

```YAML
external_dns_rfc2136_tsig_alg: hmac-sha256
```

### external_dns_rfc2136_tsig_keyname

Name of the TSIG key used for authenticated DNS updates.
Must match bind_dns_tsig_key_name.

#### Default value

```YAML
external_dns_rfc2136_tsig_keyname: "{{ bind_dns_tsig_key_name | default('mon-update-key')
  }}"
```

### external_dns_rfc2136_zone

DNS zone managed by ExternalDNS. Must match bind_dns_zone_name.

#### Default value

```YAML
external_dns_rfc2136_zone: "{{ bind_dns_zone_name | default('') }}"
```

### external_dns_service_account

ServiceAccount used by the ExternalDNS Deployment.

#### Default value

```YAML
external_dns_service_account: external-dns
```

### external_dns_tsig_secret_name

Name of the Kubernetes Secret created by this role to store only the raw TSIG key value
for ExternalDNS (extracted from the BIND9 key file format).

#### Default value

```YAML
external_dns_tsig_secret_name: external-dns-tsig
```

### external_dns_tsig_source_namespace

Namespace where the bind_dns TSIG secret lives.

#### Default value

```YAML
external_dns_tsig_source_namespace: "{{ bind_dns_namespace | default('infra-dns-zone')
  }}"
```

### external_dns_tsig_source_secret_name

Name of the Kubernetes Secret created by the bind_dns role that contains the TSIG key file.
ExternalDNS reads the raw key value from this secret.

#### Default value

```YAML
external_dns_tsig_source_secret_name: "{{ bind_dns_tsig_secret_name | default('bind-tsig-key')
  }}"
```

### external_dns_txt_owner_id

Unique identifier for TXT registry ownership records.
Prevents ExternalDNS from deleting records it does not own.

#### Default value

```YAML
external_dns_txt_owner_id: '{{ inventory_hostname }}'
```

### external_dns_wait_delay

Delay in seconds between readiness retries.

#### Default value

```YAML
external_dns_wait_delay: 10
```

### external_dns_wait_retries

Number of retries while waiting for ExternalDNS to be ready.

#### Default value

```YAML
external_dns_wait_retries: 20
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
