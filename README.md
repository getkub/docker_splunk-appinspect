# Summary 
Generate splunk-appinspect container without internet

## Basic Setup
```
my_image_name="my-appinspect"
git clone  https://github.com/getkub/docker_splunk-appinspect.git
docker build -t ${my_image_name} .
```

---
## How to run app-inspect
- cd <your_app_testing_directory>
- Pack your app in .tgz format in above directory
- mount as below example
```
my_apps_tgz_dir="/tmp/appinspect"
docker run --volume ${my_apps_tgz_dir}:/src --rm ${my_image_name}
```

## Version checks and tags
https://dev.splunk.com/enterprise/reference/appinspect/appinspectcliref/ 
```
#To list version of the software 
docker run -it --volume ${my_apps_tgz_dir}:/src ${my_image_name} splunk-appinspect list version

#To list tags
docker run -it --volume ${my_apps_tgz_dir}:/src ${my_image_name} splunk-appinspect list tags

```

### More Examples
Furthe examples - https://dev.splunk.com/enterprise/reference/appinspect/appinspectcliref#Examples
```
docker run -it --volume ${my_apps_tgz_dir}:/src ${my_image_name} splunk-appinspect inspect --mode precert --included-tags manual 

```


## Some quick tips
```
#output the result to your local system
myoutput="/tmp/appinspect.out"
mode="precert"
docker run -it --volume ${my_apps_tgz_dir}:/src ${my_image_name} splunk-appinspect inspect /src/ --excluded-tags=splunk-appinspect --mode $mode > ${myoutput}

echo "Failures="`awk -F ":" '/failure/ {gsub(" ","");print $2}' ${myoutput}`
echo "Errors="`awk -F ":" '/error/ {gsub(" ","");print $2}' ${myoutput}`
echo "Failure Lines=\n"
grep -E '^\[.+F.+\]' ${myoutput}

# Pack the app to current directory
app_name="my_app"
app_build_dir="/tmp"
tar -C ${app_build_dir}/${app_name} -czf ${app_name}.tgz .
```