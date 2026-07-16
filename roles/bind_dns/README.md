# bind_dns

Deploy a BIND9 DNS server on an OpenShift cluster with TSIG-secured dynamic updates

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [bind_dns_image](#bind_dns_image)
  - [bind_dns_job_image](#bind_dns_job_image)
  - [bind_dns_job_service_account](#bind_dns_job_service_account)
  - [bind_dns_kubeconfig](#bind_dns_kubeconfig)
  - [bind_dns_lb_ip](#bind_dns_lb_ip)
  - [bind_dns_namespace](#bind_dns_namespace)
  - [bind_dns_service_account](#bind_dns_service_account)
  - [bind_dns_tsig_key_name](#bind_dns_tsig_key_name)
  - [bind_dns_tsig_secret_name](#bind_dns_tsig_secret_name)
  - [bind_dns_wait_delay](#bind_dns_wait_delay)
  - [bind_dns_wait_retries](#bind_dns_wait_retries)
  - [bind_dns_zone_name](#bind_dns_zone_name)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### bind_dns_image

Container image for the BIND9 server.

#### Default value

```YAML
bind_dns_image: ubuntu/bind9:latest
```

### bind_dns_job_image

Container image for the TSIG key generation Job (requires oc CLI).

#### Default value

```YAML
bind_dns_job_image: quay.io/openshift/origin-cli:latest
```

### bind_dns_job_service_account

ServiceAccount used by the TSIG key generation Job.

#### Default value

```YAML
bind_dns_job_service_account: bind-initializer
```

### bind_dns_kubeconfig

Path to the kubeconfig file of the target cluster on the Ansible controller.
Defaults to the standard path produced by the oc_coreos role after SNO installation.
If the file does not exist at that path, the role falls back to ~/.kube/config.
Set to an explicit path in host_vars to override both behaviours.

#### Default value

```YAML
bind_dns_kubeconfig: /tmp/openshift/{{ inventory_hostname }}/{{ 
  inventory_hostname }}/auth/kubeconfig
```

### bind_dns_lb_ip

Static IP address assigned to the DNS LoadBalancer Service via MetalLB annotation.
Must be an address within a configured MetalLB IPAddressPool and must be free.
This IP becomes the authoritative NS address declared in the zone SOA.
REQUIRED – set in host_vars alongside metallb_ip_ranges.

#### Default value

```YAML
bind_dns_lb_ip: ''
```

### bind_dns_namespace

Namespace where the BIND9 DNS server is deployed.

#### Default value

```YAML
bind_dns_namespace: infra-dns-zone
```

### bind_dns_service_account

ServiceAccount used by the BIND9 Deployment. Granted the anyuid SCC so that
the ubuntu/bind9 image can run as root inside OpenShift.

#### Default value

```YAML
bind_dns_service_account: bind-dns
```

### bind_dns_tsig_key_name

Name of the TSIG key used for dynamic DNS updates (nsupdate / ExternalDNS).

#### Default value

```YAML
bind_dns_tsig_key_name: mon-update-key
```

### bind_dns_tsig_secret_name

Name of the Kubernetes Secret that stores the TSIG key file.

#### Default value

```YAML
bind_dns_tsig_secret_name: bind-tsig-key
```

### bind_dns_wait_delay

Delay in seconds between readiness retries.

#### Default value

```YAML
bind_dns_wait_delay: 10
```

### bind_dns_wait_retries

Number of retries while waiting for the BIND9 pod to be ready.

#### Default value

```YAML
bind_dns_wait_retries: 30
```

### bind_dns_zone_name

DNS zone name served by the BIND9 server (e.g. "ocp1.lan.example.com").
This variable is REQUIRED and must be set in host_vars or group_vars.
It is used in named.conf and in the initial zone file SOA/NS records.

#### Default value

```YAML
bind_dns_zone_name: ''
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
