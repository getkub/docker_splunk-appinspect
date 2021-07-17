# Summary 
Generate splunk-appinspect container without internet

## Basic Setup
- cd <your_working_directory>
- Pack your app in .tgz format in above directory
- mount as below example
```
docker run --volume $(pwd):/src --rm getkub/docker_splunk-appinspect
```

## Advanced options

###  To list version of the software 
```
docker run --volume $(pwd):/src -it --entrypoint=/bin/bash splunk-appinspect list version
```
