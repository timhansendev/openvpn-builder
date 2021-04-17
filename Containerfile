FROM fedora:33 as deps

RUN dnf install -y git lzo lzo-devel libselinux-devel libtool automake openssl-devel autoconf coreutils systemd-devel lz4-devel iproute-devel iproute pam pam-devel python3-docutils

FROM deps

RUN git clone https://github.com/OpenVPN/openvpn.git --branch v2.5.1 --depth 1 openvpn
WORKDIR openvpn
RUN autoreconf -i -v -f
RUN ./configure --enable-selinux --enable-systemd --enable-iproute2
RUN make -j $(nproc)
RUN make install
