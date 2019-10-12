sleep 1
# ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@[[HOST_IP]] "docker swarm init"
# token=$(ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@[[HOST_IP]] "docker swarm join-token worker -q")
# ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@[[HOST2_IP]] "docker swarm join [[HOST_IP]]:2377 --token $token"

curl https://download.docker.com/linux/static/stable/x86_64/docker-19.03.3.tgz | tar -xz -C /tmp
cp /tmp/docker/docker /usr/bin/docker
mkdir -p .docker/cli-plugins
docker run -v ~/:/workshop dapworkshop/workshop:0.9
