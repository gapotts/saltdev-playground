get_rvm_gpg_key:
  cmd.run:
    - name: 'gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3' 
    - unless: 'gpg2 --list-keys | grep RVM'

install_rvm:
  rvm.installed:
    - name: '2.0.0-p648'
    - default: True