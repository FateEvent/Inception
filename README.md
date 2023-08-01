# Inception

## Ready to start: Configuration of the virtual machine

Configuration of the VM and installation of Docker Composer:
* <https://github.com/wpf68/Inception_42/blob/master/Install%20Machine%20Virtuel%20sur%20Mac%20230107.txt>;
`sudo apt-get install vim -y`
* <https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-debian-10>;

For the configuration file of Nginx I followed:
* <https://www.digitalocean.com/community/tutorials/php-fpm-nginx>;
* <https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a>.

## Links

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

For further info, see:
* <https://stackoverflow.com/questions/44769315/how-to-see-docker-image-contents>;

What's the difference between a Docker container and a virtual machine?
* <https://stackoverflow.com/questions/16047306/how-is-docker-different-from-a-virtual-machine/16048358#16048358>;

For an explanation of the concepts of "continuous integration" and "continuous delivery", see:
* <https://www.redhat.com/en/topics/devops/what-is-ci-cd>;

Here is the official documentation of Nginx:
* <https://nginx.org/en/docs>;

MariaDB, MySQL and the MySQL command line client:
* <https://dev.mysql.com/doc>;
* <https://mariadb.org/documentation>;
* <https://dev.mysql.com/doc/refman/8.0/en/programs-client.html>;

WordPress and the WordPress cli:
* <https://learn.wordpress.org>;
* <https://developer.wordpress.org/cli/commands>.

## List of Docker commands

```
systemctl start/stop docker				# starts/stops Docker service
systemctl enable docker					# activates Docker service
docker ps								# lists all active containers
docker ps -a							# lists all containers 
docker pull								# downloads a Docker image 
docker start/stop CONTAINER_ID			# starts/stops a container

# https://docs.docker.com/engine/reference/commandline/kill
docker kill CONTAINER_ID				# kills (stops, sends a SIGKILL to) a container
docker images							# lists all the docker images which have been downloaded
docker build -t <TAG_NAME> .			# builds an image and attributes it a name
docker run -ti -p 8080:443 <TAG_NAME>	# runs a container from an image IN INTERACTIVE MODE
docker exec -ti IMAGE bash				# allows the user to enter a running container to execute commands

# https://docs.docker.com/engine/reference/commandline/system_prune
docker system prune						# Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes
docker rm CONTAINER_ID					# removes a container
docker image rm REPOSITORY | IMAGE_ID	# removes an image
docker images rmi						# removes all the images	
```

A good tutorial on the subject:
* <https://tuto.grademe.fr/inception>;
https://github.com/mprigent/Inception

To connect to the Wordpress site as admin:
`https://login.42.fr/wp-login.php`
* <https://wordpress.com/support/dashboard>

## Appendix A

### Quelques notes explicatives

Conteneur docker:
Enveloppe virtuelles:
Auto porteurs
Auto documentés
Simplifie la maintenance et le suivi.
Utilise une Isolation des ressources plutôt que virtualisation
Conteneurs : plutôt pour des applications spécifiques
VM: plutôt pour des besoins d’infrastructure ou d’OS (ressources réservées) 
Conteneurs: Système de virtualisation plus léger
Isolation des processus système mais les ressources CPU/RAM et disque sont partagées avec le système hôte.
Avantages:
- le conteneur ne réserve pas les ressources attribuées, qui peuvent démarrer plus rapidement que des machines virtuelles;
- les conteneurs dockers sont immuables et stateless.

Docker run -it  va exécuter notre image en mode interactif, on aura donc la version qui va s’afficher.
Docker run nom_de_l’image  permet de faire tourner notre conteneur à partir de l’image.

La commande `docker-compose up --build` sert à démarrer les conteneurs définis dans le fichier docker-compose.yml en reconstruisant les images Docker si nécessaire.

`docker-compose`: la commande principale pour interagir avec Docker Compose
`up`: l'option qui indique à Docker Compose de démarrer les conteneurs
`--build`: l'option qui indique à Docker Compose de reconstruire les images des services spécifiés dans le fichier docker-compose.yml avant de les démarrer. Cela signifie que si une image est déjà construite pour un service, elle sera re-construite pour refléter les changements apportés au Dockerfile ou aux fichiers sources.

Pour se connecter en remote au SSH à partir de VSCode:
- cliquer sur l'icone "Remote ssh" en bas à gauche de la fenêtre VSCode
- choisir l'option `Connect to host`
- taper `<username>@<IP>:<PORT>` | `<username>@<IP> -p <PORT>`

Wordpress:
`<login>.42.fr/wp-login.php`

Mariadb:
Commande pour lancer mariadb:
```
docker exec -ti mariadb bash
mariadb -p						# pour rentrer dans mariadb en tant qu'utilisateur, en insérant sont mot de passe
SHOW DATABASES;
USE <NOM_DATABASE>
SHOW TABLES;
SELECT * FROM <NOM_TABLE>		# SELECT * FROM WP_USER
DESC <NOM_TABLE>				# DESC WP_USER
```