# include common pakages to ensure it is in
# scope for requisites if applied directly.
include:
  - common.packages

install_ruby_packages:
  pkg.installed:
    - pkgs:
      - "ruby"
      - "rubygems"
      - "ruby-devel"

install_fpm:
  gem.installed:
    - name: "fpm"
    - require:
      - pkg: install_dev_tools
      - pkg: install_ruby_packages