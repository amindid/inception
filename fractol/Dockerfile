FROM debian:12.5

# Update and install dependencies including xauth
RUN apt update -y 
RUN apt install -y git
RUN apt install -y make
RUN apt install -y gcc
RUN apt install -y xorg
RUN apt install -y libxext-dev
RUN apt install -y zlib1g-dev
RUN apt install -y libbsd-dev
RUN apt install -y x11-apps
RUN apt install -y xauth

# Set TERM environment variable
ENV TERM=xterm

# Clone the necessary repositories
RUN git clone https://github.com/amindid/fractol.git && \
    git clone https://github.com/42Paris/minilibx-linux.git

# Build MinilibX
RUN cd minilibx-linux && make

# Build fractol with debugging info
RUN cd fractol && make bonus 
# RUN cd fractol && make bonus CFLAGS="-Wall -Wextra -Werror -g"

# Set the working directory
WORKDIR /fractol

# Command to run fractol_bonus
CMD ["./fractol_bonus", "julia", "-1.476", "0"]

# FROM debian:12.5

# RUN apt update -y

# RUN apt install -y git

# RUN apt install -y make

# RUN apt install -y gcc

# RUN apt install -y xorg libxext-dev zlib1g-dev libbsd-dev xvfb procps x11-apps xauth

# ENV TERM=xterm

# RUN git clone https://github.com/amindid/fractol.git

# RUN git clone https://github.com/42Paris/minilibx-linux.git

# RUN cd minilibx-linux/ && make

# RUN cd ../fractol && make bonus

# # CMD ["./fractol_","julia","-1.476", "0"]
# # CMD ["yes"]
# # CMD ["xvfb-run", "--auto-servernum", "--", "./fractol_bonus", "julia", "-1.476", "0"]
# WORKDIR /fractol

# # ENTRYPOINT ["xvfb-run", "--auto-servernum", "--server-args='-screen 0 1280x1024x24'"]

# CMD ["./fractol_bonus", "julia", "-1.476", "0"]