# Inception

Download the image CD for Debian 10 "Debian Buster debian-10.9.0-amd64-xfce-CD-1.iso" (amd64) from the official site:
* <https://www.debian.org/releases/buster/debian-installer>

Useful resources to start:

* <https://www.differencebetween.com/difference-between-primary-partition-and-vs-logical-partition>

For issues that may rise during the installation of Docker on the VM:
* <https://itsfoss.com/apt-key-deprecated>;
* <https://askubuntu.com/questions/307/how-can-ppas-be-removed>.

In addition to the official Docker documentation:

* <https://docs.docker.com>;

you can consult an interesting course offered by Openclassroom (in French):
* <https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker>;

* <https://stackoverflow.com/questions/44769315/how-to-see-docker-image-contents>


* <https://stackoverflow.com/questions/16047306/how-is-docker-different-from-a-virtual-machine/16048358#16048358>;

For an explanation of the concepts of "continuous integration" and "continuous delivery", see:
* <https://www.redhat.com/en/topics/devops/what-is-ci-cd>;

Configuration of the VM and installation of Docker Composer:
* <https://github.com/wpf68/Inception_42/blob/master/Install%20Machine%20Virtuel%20sur%20Mac%20230107.txt>;
`sudo apt-get install vim -y`
* <https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-debian-10>;

For the configuration file of Nginx I followed:
* <https://www.digitalocean.com/community/tutorials/php-fpm-nginx>

* <https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a>
`docker build -t nginx_2 .`
`docker run -ti -p 8080:443 nginx_2`
`docker ps`
`docker stop CONTAINER_ID`
`docker system prune`
`docker images`
`docker image rm REPOSITORY | IMAGE_ID`

A good tutorial on the subject:
* <https://tuto.grademe.fr/inception>