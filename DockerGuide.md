
## Change Docker Root Dir

```bash
docker info | grep "Docker Root Dir"
service docker stop

mv /var/lib/docker /root/data/docker
ln -s /root/data/docker /var/lib/docker

```
