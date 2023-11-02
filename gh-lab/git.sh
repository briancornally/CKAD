The exam is based on Kubernetes v1.27.

# vagrant 
vagrant destroy
vagrant halt
vagrant init bento/ubuntu-20.04-arm64
vagrant ssh
vagrant up
vagrant up --provider=parallels
vagrant up --provider=vmware_desktop
VAGRANT_DEFAULT_PROVIDER=vmware_desktop
VAGRANT_DEFAULT_PROVIDER=parallels

# parallels
- https://github.com/Parallels/vagrant-parallels
- https://parallels.github.io/vagrant-parallels/docs/
- https://parallels.github.io/vagrant-parallels/docs/configuration.html
- https://app.vagrantup.com/boxes/search?provider=parallels&q=arm
vagrant plugin install vagrant-parallels
vagrant up --provider=parallels

# VMware
https://customerconnect.vmware.com/en/evalcenter?p=fusion-player-personal-13
https://developer.hashicorp.com/vagrant/docs/providers/vmware/vagrant-vmware-utility
sudo launchctl load -w /Library/LaunchDaemons/com.vagrant.vagrant-vmware-utility.plist
vagrant plugin install vagrant-vmware-desktop
vagrant up --provider vmware_desktop

Articles
- https://devopscube.com/kubernetes-cluster-vagrant/ nok

# not fully automated
- https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/
git clone https://github.com/mmumshad/kubernetes-the-hard-way # ?# https://medium.com/paul-zhao-projects/bootstrap-kubernetes-the-hard-way-on-vagrant-on-local-machine-bd085bb196b3

# Generic VirtualBox
git clone https://github.com/riyasharma09/vagrant-kubernetes-cluster # nok
git clone https://github.com/techiescamp/vagrant-kubeadm-kubernetes # nok https://devopscube.com/kubernetes-cluster-vagrant/
git clone https://github.com/pksheldon4/cks-cluster # ??
git clone https://github.com/riyasharma09/vagrant-kubernetes-cluster # ??

# ARM VMware
git clone https://github.com/emmaliaocode/vagrant-vmware-macos-arm.git # https://medium.com/@emmaliaocode/setup-a-multi-node-kubernetes-cluster-with-vagrant-and-vmware-on-apple-silicon-m1-m2-38b5b2ceb3d9
git clone https://github.com/mmumshad/certified-kubernetes-administrator-course.git # 4ok https://gist.github.com/akinsella/ab51ec72dd954d93221df9928a00c642
git clone https://github.com/nickolaev/vagrant-parallels-m1-k8s-cilium # 6ok https://www.linkedin.com/posts/nnikolaev_weekend-project-m1-parallels-vagrant-activity-6994950964428324864-GM9j/

# Multi
git clone https://github.com/pires/kubernetes-vagrant-coreos-cluster #5
