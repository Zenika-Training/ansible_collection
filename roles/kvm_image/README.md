# kvm_image

Ensure an image file (ISO, qcow2, ...) is present on a KVM host, downloading it only if missing

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [kvm_image_checksum](#kvm_image_checksum)
  - [kvm_image_dest](#kvm_image_dest)
  - [kvm_image_target_host](#kvm_image_target_host)
  - [kvm_image_url](#kvm_image_url)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### kvm_image_checksum

Expected checksum of the downloaded file, in get_url format (e.g.
"sha256:<hex digest>"). Strongly recommended. Left empty, no integrity
check is performed and a corrupted or pre-existing mismatched file at
kvm_image_dest is never caught.

#### Default value

```YAML
kvm_image_checksum: ''
```

### kvm_image_dest

Destination path on kvm_image_target_host. Required.
If the file already exists there (e.g. pre-staged for an air-gapped KVM
host), it is left untouched and nothing is downloaded - this role only
fetches what is missing.

#### Default value

```YAML
kvm_image_dest: ''
```

### kvm_image_target_host

Ansible inventory hostname of the KVM host. The download (if needed) runs
delegated to this host - never on the Ansible controller.

#### Default value

```YAML
kvm_image_target_host: localhost
```

### kvm_image_url

URL of the image file to download. Required.

#### Default value

```YAML
kvm_image_url: ''
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
