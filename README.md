# eic-operations

How to setup your very own eInfraCentral instance:

0. Dependencies
    * Java 8
    * Schemagen 2.2.8
    * Maven 3.5.0
    * Docker (17.12.0-ce, and 18.03.0-ce tested ; try http://get.docker.com/)
    * Docker-compose (1.14.0, 1.16.1, and 1.19.0 tested ; try `sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose`)
    
1. Get the code
    ```bash
    git clone https://github.com/eInfraCentral/eic-operations.git
    cd eic-operations
    ./clone.sh
    ```
2. Install site dependencies, then set up nginx, and analytics
    ```bash
    ./prod.sh install
    ./sites.sh setup
    ./anal.sh setup
    ```
3. Fill in eic-docker/secret.env with your instance's secrets (look at the template there for guidance)
4. Build & raise backend
    ```bash
    ./mcip.sh
    ./tom.sh up
    ```
5. Populate repository in some way (either POST your own, or use `./dat.sh add resources` for an older snapshot of eic's catalogue)
    ```bash
    ./dat.sh add types
    ./dat.sh add resources
    ./tom.sh restart
    ```
6. Build & raise frontend, and analytics:
    ```bash
    ./prod.sh up
    ./anal.sh up
    ```
    
* To enable maintenance page:
    ```bash
    ./sites.sh enable maintenance
    ```
* To disable maintenance page:
    ```bash
    ./sites.sh enable proxy
    ```
* To run docker as a sudoer:
     ```bash
    sudo groupadd docker
    sudo usermod -aG docker $USER
     ```
* To fix elastic restart loops until reboot:
    ```bash
    sysctl -w vm.max_map_count=262144
    ```
* To fix elastic restart loops forever:
    * Put it in sysctl.conf