install_common_packages:
  pkg.installed:
    - pkgs:
      - nfs-utils
      - autofs

install_dev_tools:
  pkg.group_installed:
    - name: "Development tools"

install_rpmdevtools:
  pkg.installed:
    - pkgs:
      - rpmdevtools

install_common_devel_pkgs:
  pkg.installed:
    - pkgs:
      - openssl-devel
      - libaio-devel
      - libacl-devel
      - glibc-devel
      - libxml2-devel
      - bzip2-devel
      - libXpm-devel