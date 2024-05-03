# inception

- what is Docker ?

Docker is a popular platform that simplifies the process of creating, deploying, and managing containers by providing a set of tools and a platform for containerization .

- what is Docker Engine ?

Docker Engine is the software responsible for creating and managing containers, providing a consistent and reliable platform for developing, shipping, and running applications. it consists of several parts :

1. DOCKER DAEMON (dockerd): This is a persistent process that manages Docker objects, such as images, containers, networks, and volumes.
2. DOCKER CLIENT (docker): This is the primary interface that users interact with to communicate with the Docker daemon.
3. REST API: Docker Engine provides a RESTful API that allows external programs to communicate with the Docker daemon.
4. COMMAND-LINE INTERFACE (CLI): The Docker CLI provides a set of commands that users can run in their terminal to interact with Docker Engine.
5. CONTAINERD AND OTHER COMPONENTS: Docker Engine also includes other components like Containerd, which is responsible for container execution and supervision, and other libraries and dependencies necessary for its operation.

- what is image ?

An image is a template or blueprint for creating containers. it contains everything neede to run a specific application including the code, runtime, libraries,dependencies,and settings. images are immutable and read-only; once built, they cannot be modified .

- what is container ?

A container is a running instance of a Docker image. Containers are isolated environments that encapsulate an application and its dependencies, allowing it to run consistently across different environments. Containers are lightweight, portable, and can be started, stopped, and moved between different host systems with minimal overhead. Containers are ephemeral by default; changes made within a container are lost when the container is stopped unless persistent storage is configured.

- what is the difference between image and container ?

NATURE: An image is a static, immutable file that serves as a blueprint for containers, while a container is a running instance of an image.
STATE: Images are read-only and immutable, while containers are writable and can store changes made during runtime (unless using techniques like Docker commit to create a new image from a container).
LIFECYCLE: Images persist between runs and can be used to create multiple containers, while containers are transient and exist only while they are running.
USAGE: Images are used to package and distribute applications, while containers are used to run and manage those applications in isolated environments.

- what is Dockerfile ?

A dockerfile is a text document that contains instructions for building a docker image. These instructions typically include commands for copying files into the image , installing dependencies, setting environment variables, and specifying the commands to run when the container is started.

here are some of the most commonly used commands in a dockerfile :

1. FROM: syntax(FROM image:tag); command that specifies the base image from which you are building. it is the starting point of your dockerfile.
2. RUN: syntax(RUN command); executes commands during the docker image built process, these commands typically install packages, update repositories, configure the environment, or perform other tasks necessary to set up the application environment within the image.
3. COPY: syntax(COPY src dest); copies files or directories from the host machine into the container's filesystem.
4. ADD: syntax(ADD src dest); to the same as COPY + supports URLs and can automatically unpack compressed files.
5. WORKDIR: syntax(WORKDIR path); this sets the working directory for any RUN,CMD,ENTRYPOINT,COPY,and ADD instructions that follow it in the dockerfile.
6. ENV: syntax(ENV key value); sets environment variables in the container.
7. EXPOSE: syntax(EXPOSE port); this command informs docker that the container listens on the specified network ports at runtime. it does not actually make the ports accessible from outside the container.
8. CMD: syntax(CMD ["executable", "param1", "param2"]); specifies the default command to run when the container starts, there  can only be one CMD instruction in a dockerfile, if multiple CMD instructions are provided, only the last one will take effect.
9. ENTRYPOINT: syntax(ENTRYPOINT ["executable", "param1", "param2"]); specifies the executable that should be run when the container starts.
10. VOLUME: syntax(VOLUME path); This command creates a mount point with the specified name and marks it as externally mounted.