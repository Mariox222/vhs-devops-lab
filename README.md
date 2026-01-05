# TRUE NORTH engineering

# USAGE
Get the Dockerfile, run.sh and build.sh files.

Run the `build.sh`
```
sudo chmod +x build.sh
./build.sh
```

Run the `run.sh`
```
sudo chmod +x run.sh
./run.sh
```

Visit http://localhost:18081
Username is `admin`
Find out the password with
```
podman exec -t -i nexus /bin/bash
cat /opt/sonatype-work/nexus3/admin.password
```
Reset the password upon first log in