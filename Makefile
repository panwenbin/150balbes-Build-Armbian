EMPTY:=
COMMA:=,
SPACE:= $(EMPTY) $(EMPTY)


compile := sudo ./compile.sh
compile += NO_APT_CACHER=yes

compile += LIB_TAG=k310
compile += BOARD=aml-s805
# compile += BOARD=amlogic-snail-s101


# https://docs.armbian.com/Developer-Guide_Build-Options/
compile += KERNEL_KEEP_CONFIG=yes
compile += KERNEL_EXPORT_DEFCONFIG=yes


compile += BRANCH=default
compile += BUILD_KSRC=no
compile += EXPERT=no


compile += ARMBIANSERVER="mirrors.miwifi.io/armbian"
compile += UBUNTU_MIRROR="mirrors.cloud.tencent.com/ubuntu-ports/"



.PHONY: all config kernel bionic

all: kernel


config:
	$(compile) BUILD_DESKTOP=no KERNEL_ONLY=yes KERNEL_CONFIGURE=yes


kernel:
	$(compile) BUILD_DESKTOP=no KERNEL_ONLY=yes KERNEL_CONFIGURE=no


bionic:
	$(compile) BUILD_DESKTOP=no KERNEL_CONFIGURE=no KERNEL_ONLY=no RELEASE=$@
	# @if [ -d /home/vagrant/armbian/.tmp/rootfs-default-aml-s9xxx-bionic-no ]; then \
	# 	sudo umount -l /home/vagrant/armbian/.tmp/rootfs-default-aml-s9xxx-bionic-no/tmp/overlay || true; \
	# 	sudo umount -l /home/vagrant/armbian/.tmp/rootfs-default-aml-s9xxx-bionic-no || true; \
	# 	rmdir /home/vagrant/armbian/.tmp/rootfs-default-aml-s9xxx-bionic-no 2>/dev/null || true; \
	# else true; fi


