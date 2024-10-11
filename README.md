# SQL Tutorial

This repo contains the materials needed for my "SQL" tutorial

## Setup

- [ ] (**Required**) Install docker [Docker Desktop](https://www.docker.com/products/docker-desktop/) if you don't have it in your system
- [ ] (**Optional**) Install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) desktop app to interact with the MySQL (Server) DMS
- [ ] We use docker compose to install and run an RDMS instance of the MySQL (Server)
  - [ ]  Run the following command to install and run an instance of MySQL(Server), and MySQL workbench web portal :
      ```sh
      docker compose -f ./mysql.yml up -d  --wait --wait-timeout 30
      ```
  - [ ]  Run the following command to stop them:
      ```sh
      docker compose -f ./mysql.yml down
      ```
  - [ ]  Run the following command if you want to remove them and start all over again:
      ```sh
      docker compose -f ./mysql.yml rm -v
      ```
 > :warning: Note that this will open the following:
 >  - MySQL(Server) on port **[3306](http://localhost:3306)**
 >  - MySQL workbench web portal on port **[3000](http://localhost:3000)**

- [ ] To connect to the MySQL(Server) instance

  - [ ] Some of the clients that you can use to do so are:
    - [ ] [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) desktop
    - [ ] MySQL Workbench web portal on port **[3000](http://localhost:3000)**
    - [ ] Vscode extension (**[Database Client](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-database-client2)**)

  - [ ] Use the following properties to connect:

      | Property | Value (Workbench Web portal) | Value (Workbench desktop or Vscode extension) |
      |----------|------------------------------|-----------------------------------------------|
      | Hostname | mysql-db                     | localhost or 127.0.0.1                        |
      | Port     | 3306                         | 3306                                          |
      | Username | root                         | root                                          |
      | Password | 123456                       | 123456                                        |

## Run Automated Tests
To run the automted tests scripts you need to do the following after the setup
- [ ] You need to have *[nodejs](https://nodejs.org/en)* installed in your machine
  > :warning: Note that its better to use a node version manager like *[nvm](https://github.com/nvm-sh/nvm)* or  *[nvm-windows](https://github.com/coreybutler/nvm-windows)* for windows to install *[nodejs](https://nodejs.org/en)*
- [ ] Open a new terminal and change your current directory to `auto/basic-style`:
    ```sh
    cd ./auto/basic-style/
    ```
- [ ] Install all the needed packages with `npm`:
    ```sh
    npm install
    ```
- [ ] Run the test by the follwing command:
    ```sh
    npm run test
    ```
- [ ] You can check the testing and covarage reports throgh the terminal or from the auto genrated html files inside the `./sql-tut/auto/basic-style/reports` folder


## :nerd_face: Credits & Resources

- **[SQL for Data Analysis | شاهد كيف أصبح الفيل والدرفيل أصدقاء](https://www.youtube.com/watch?v=kb-_GbpH3sQ)** by **[by بالعربي Big Data (YouTube Channel)](https://www.youtube.com/@bigdata4756)**
- **[Database Testing](hhttps://www.youtube.com/playlist?list=PLUDwpEzHYYLtmxThtmsBxocKuicJOddGj)** playlist by **[SDET- QA (YouTube Channel)](https://www.youtube.com/@sdetpavan)**
- **[MySQL Tutorial](https://www.mysqltutorial.org/)**
