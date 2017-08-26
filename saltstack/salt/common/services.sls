{% from "common/map.jinja" import rpcbind with context %}

# include common pakages to ensure it is in
# scope for requisites if applied directly.
include:
  - common.packages

start_rpcbind_service:
  service.running:
    - name: {{ rpcbind.service }}
    - enable: True
    - require:
      - pkg: install_common_packages

