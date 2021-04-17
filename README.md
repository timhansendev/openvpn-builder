# openvpn-builder

A containerized build of openvpn for Fedora 33. This serves as a basis for a containerized version of openvpn to run serverless on knative. 

Utilize `buildah bud -f Containerfile -t openvpn:2.5.4` and run podman to test out the image.  
