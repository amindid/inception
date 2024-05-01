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