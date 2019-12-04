# This is still a WIP

# Armagetron server made easy with docker

The intention of this repository is to make your life running a server easier. If you would like to expirement with settings or scripts, this is a great way to get started doing that locally. You can then take your learnings here and apply them to a server hosted over the internet. 

## Getting Started

These instuctions will get you running an armagetron server locally, which you will be able to connect your client to. From there, the world is your oyster. 

### Prerequisites

To get going, all that you will actually need is docker. I use a mac, so the commands that I will be providing are bash commands. If you use another OS, you can probably follow along but may have to change things slightly. I might suggest also having python3, since that's what I use for tron scripting.

Here are instructions for installing docker on a mac: https://docs.docker.com/docker-for-mac/install/. If you're not using a mac, I'm sure you can find instructions on installing docker elsewhere with ease.


### Getting it running

Now that you've got docker installed and this code cloned, we can simply build our docker image by running the following from inside the root level of this repository:

```
docker build --build-arg servername_arg=[replace this with your internal server name] -t [replace this with a tag for your docker image] .
```

For example: 
```
docker build --build-arg servername_arg=sumosmart -t sumosmart .
```

Now we can run the docker container with:

```
docker run -p 4534:4534/udp [tag you gave to your docker image]
```
Note: If you start it this way, you may not be able to kill it with cntrl+c. From another terminal, you can run `docker -ps`, then copy the container ID into `docker kill [containerid]`. 

Now that you have it running, open up your tron client, go to `Play Game -> Multiplayer -> Lan Multiplayer` and voila, you should see your server started there. It will be called YOUR_TEST_SERVER which you can change in settings_custom.cfg. If you join it, you should see a custom message printed to your console at the start of new rounds! This was implemented from a script we have in the server_scripts directory called `message_every_round.py`. 

If you'd like to start the docker container and keep a shell attached so you can see what's going on, start the container up with 
```
docker run -p 4534:4534/udp -it --entrypoint "/bin/bash" [tag you gave to your docker image]
```
From here, you should be in the `/home/root/armagetronad/servers/${servername_arg}/scripts` directory (otherwise, cd into it). From within there, you can start the server with `./start.sh start`. This is helpful for getting insights into what's going on with your server. For example, after you start the server, take a look at what's being logged to ladderlog.txt with: (from within the scripts directory)
```
tail -F ../var/ladderlog.txt
```
As you play, you'll see a bunch of stuff being logged to this file. We can trigger things to happen in our scripts based on what gets logged to that file. 


## Authors

* **raph** - *Initial work*xw

## Acknowledgments

* Thanks a bunch to Nelg and some other tron artifacts that have been left out there. 
