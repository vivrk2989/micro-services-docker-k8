# this file will automate the creation of an image

# from which image - image we used as our base image
FROM nginx
# label to communicate with team members
LABEL MAINTAINER=VIVEK@SPARTAGLOBAL.communicate

# copy data from localhost to container
COPY index.html /usr/share/nginx/html

# expose the port 
EXPOSE 80

# launch/create a container 
CMD ["nginx", "-g", "daemon off;"]