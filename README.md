# 2022DevOpsGrp5

## Prerequisite
To use the project, create a repo named key and add a rsakey.

```bash
 mkdir key;
 ssh-keygen;
```

Then open a bash and start Vagrant with:
```bash
vagrant up
```
> You need to get more than 4Go free RAM 

# Step 1 : Configuration

## Run1 configuration

Connect on vagrant ssh with:
```bash
vagrant ssh run1
```
Check if Docker is working : `docker -v`

Add these line to add gitlab-runner in docker
```bash
docker exec -it runner gitlab-runner register

docker volume create gitlab-runner-config;

docker run -d --name gitlab-runner --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v gitlab-runner-config:/etc/gitlab-runner \
    gitlab/gitlab-runner:latest;
```
and enter URL and registration token from gitlab (ProjectForDevOps):  
`Settings -> CI/CD -> Runners`

Normally, if everything is ok, you will see an available specific runners.

Then go in :  
`Settings -> CI/CD -> variables -> Add variable`  

```
1st variable:
key = DEPLOY_RSA_KEY 
value = "your rsakey from repo key"
type = file
```

```
2nd variable:
key = PROD_SERVER_IP
value = 192.168.101.2
type = variable
```

```
3rd variable:
key = PROD_SERVER_USER
value = user1
type = variable
```

## Prod configuration

Then connect on prod ssh
```bash
 vagrant ssh prod
```
add a new user named user1
```
useradd -m user1
```

Config NGINX
```
nano /etc/nginx/sites-available/default
```
In server, change root name with : 
`
root /home/user1/dist/dist;
`  

# Step 2 : Send web project automatically in prod VM with Gitlab-CI

1. Connect on web project gitlab
2. Go on : `CI/CD -> Pipelines`
3. Run pipeline
4. Take a coffee, it's gonna be probably long to wait if there is no issue lol
5. When every stages are "passed" it is supposed to be ok
6. check on `vagrant ssh prod` if web project are installed, builed and published
```bash
    cd /home/user1/dist/;
    ls;
```

If repo `dist` and `node_modules` exist, everything is great and you can go on our favorite browser and write URL : `192.168.101.2:80` and it will display the project ;)
