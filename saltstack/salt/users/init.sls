# ----------------
# Users formula
# ----------------

# include common pakages to ensure it is in
# scope for requisites if applied directly.
include:
  - common.packages

# mount local build user on /home2 to allow 
# users to utilize NIS to automount home dirs.
# from filer in dev lab if disired.
{% from "users/map.jinja" import rpmsetup with context %}

manage_home2_dir:
  file.directory:
    - name: "/home2"
    - user: "root"
    - group: "root"
    - dir_mode: 755

# mock group is recommended group for rpm build
add_mock_group:
  group.present:
    - name: "mockbuild"
    - gid: 53622

add_build_user:
  user.present:
    - name: "opsbuild"
    - home: "/home2/opsbuild"
    - uid: 53622
    - shell: "/bin/bash"
    - gid: "mockbuild"
    - require:
      - file: manage_home2_dir
      - group: add_mock_group

# setup rpmbuild directory structure &
# instantiate .rpmmacros file
setup_rpm_build:
  cmd.run:
    - name: {{ rpmsetup.path }}
    - unless: "test -d ~opsbuild/rpmbuild"
    - runas: "opsbuild"
    - require:
      - pkg: install_rpmdevtools
      - user: add_build_user


