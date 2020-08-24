#d1. download role helperdode
git clone https://github.com/RedHatOfficial/ocp4-helpernode.git
#2. fill vars.yaml

#3. fill in install-config.yaml

#чтобы не пересоздавать по новой диски в vmware, команда для затирки boot-сектора, после нее рестарт ВМ и она по новой начнет инсталлиться через PXE
ssh -i /root/.ssh/id_rsa core@v00opshift01tst-bootstrap 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'
ssh -i /root/.ssh/id_rsa core@v00opshift02tst-master0 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'
ssh -i /root/.ssh/id_rsa core@v00opshift03tst-master1 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'
ssh -i /root/.ssh/id_rsa core@v00opshift04tst-master2 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'
ssh -i /root/.ssh/id_rsa core@v00opshift05tst-worker0 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'
ssh -i /root/.ssh/id_rsa core@v00opshift06tst-worker1 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'
ssh -i /root/.ssh/id_rsa core@v00opshift06tst-worker2 'sudo dd if=/dev/zero of=/dev/sda bs=1M count=100'



#сборка ingnition из install-config.yml
openshift-install create manifests
#
vi manifests/cluster-scheduler-02-config.yml
  mastersSchedulable: false
#
openshift-install create ignition-configs
cp *.ign /var/www/html/ignition/ 
restorecon -vR /var/www/html/ 
chmod o+r /var/www/html/ignition/*.ign

#проверка состояния сборки через bootstrap
ssh -i StrictHostKeyChecking=no core@v00opshift01tst-bootstrap 'journalctl -b -f -u bootkube.service'
#более подробный вывод
ssh -i StrictHostKeyChecking=no core@v00opshift01tst-bootstrap 'journalctl -b -f'

#export auth for executing "oc" commands
export KUBECONFIG=/root/ocp45_install/INSTALL_DIR/auth/kubeconfig

#апрув сертов, уже забыл зачем
oc get csr
for i in $(oc get csr -o name); do oc adm certificate approve $i; done

#проверка что кластер поднялся
oc get no
watch -n5 oc get clusteroperators
cd /root/ocp45_install/INSTALL_DIR
openshift-install wait-for install-complete
