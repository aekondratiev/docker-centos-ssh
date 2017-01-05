Centos 7 + sshd

Clone and build:
`docker build --rm --tag andry/ssh:1 .`

Run with custom password:
`docker run -d -p 0.0.0.0:2222:22 andry/ssh:1`
View root password:
`docker logs <CONTAINER_ID>`

Run with own passord:
`docker run -d -p 0.0.0.0:2222:22 -e "ROOT_PASS=123456" andry/ssh:1`

Connect:
`ssh root@127.0.0.1 -p 2222`

Or use your keys in `files/root/.ssh/authorized_keys`
