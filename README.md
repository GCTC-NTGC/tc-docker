
# TalentCloud docker integration

Run and develop with just git and docker installed on your system.  Tested on Linux, Mac and Windows.

## Run the stack

To get started, clone the TalentCloud repo to this directory. 

#### HTTPS
```
$ git clone  https://github.com/GCTC-NTGC/TalentCloud.git
```

#### SSH
```
$ git clone git@github.com:GCTC-NTGC/TalentCloud.git
```

From this directory run:

```
$ docker-compose build
$ docker-compose up
```

### Default Environment

You can setup talent cloud in various ways by editing the `.env` the following instructions are for if you are using the default environment configuration.

Make a hosts entry for talent.test that points to localhost, 
you should then be able to access the application at https://talent.test/ 
(you will need to accept the self-signed certificate).

## Useful Docker Commands

Build your containers
```
$ docker-compose build
```

See status of containers
```
$ docker ps
```

Start your containers
```
$ docker-compose up
```

Stop your containers
```
$ docker-compose down
```

Run a command from your primary docker container
```
docker exec -it talentcloud-op <command>
```

Useful commands
```
docker exec -it talentcloud-op npm install
docker exec -it talentcloud-op npm run dev
docker exec -it talentcloud-op make npm-dev
```

Get shell access to the primary container
```
docker exec -it talentcloud-op sh
```

Restart Docker (Windows and OSX)
```
docker-machine restart
```

Restart Docker (Linux)
```
sudo service docker restart
```

Purge all stopped containers
```
docker system prune -a
```



## Components

* nginx (front-end) exposed on ports 80, 443
* talentcloud-op: asserts environment and used for ongoing development
* talentcloud: the php-fpm application
* Postgres
* adminer exposed on port 8060
