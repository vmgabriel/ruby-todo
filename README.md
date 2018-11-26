# TODO Management APP

[![Built with Spacemacs](https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg)](http://spacemacs.org)

A simple application for the use of TODO management for the control of all functionalities, events and requirements.

## Candidate:
Gabriel Vargas Monroy

### How to use this project

1. **Clone this Repo**
  ```sh
  → git https://github.com/vmgabriel/ruby-todo.git
  ```

2. **Build the Dockerfile**
  ```sh
  → docker-compose build
  ```

3. **If there were no errors in the previous step, you can rails server**
  ```sh
  → docker-compose up
  ```

4. **And, open the app in your favorite browser on OS/X**
  ```sh
  → open http://$(docker-machine ip default):1337
  ```

6. **Open de page in port 3000**

[LInk Project](http://localhost:3000 "Link Project")


#### Used technologies

Rails
![Image Logo Rails](image/rails_logo.png "Image rails")

Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages. It encourages and facilitates the use of web standards such as JSON or XML for data transfer, HTML, CSS and JavaScript for user interfacing. In addition to MVC, Rails emphasizes the use of other well-known software engineering patterns and paradigms, including convention over configuration (CoC), don't repeat yourself (DRY), and the active record pattern.

a [Rails](https://rubyonrails.org/) application

DB - Persistence - MONGO

![Image Logo Mongo](image/mongo-db-logo.png "Image Mongo")

The MongoDB Server is written in C++ with an extensive suite of tests in JavaScript. To get started with the server, you will want to see Building with Server. For help with the tools, see Building the Tools or http://github.com/mongodb/mongo-tools. If you are looking to instead get started with drivers that connect to the server, check out our list of official drivers for more information.

[Mongo](https://www.mongodb.com/ "mongo link")

Deploy - Docker

![Image Logo Docker](image/docker.png "Image Docker")

Docker is the company driving the container movement and the only container platform provider to address every application across the hybrid cloud. Today’s businesses are under pressure to digitally transform but are constrained by existing applications and infrastructure while rationalizing an increasingly diverse portfolio of clouds, datacenters and application architectures. Docker enables true independence between applications and infrastructure and developers and IT ops to unlock their potential and creates a model for better collaboration and innovation. 

[Docker](https://www.docker.com/ "Docker link")


### Licence

GNU-GPL 3.0
