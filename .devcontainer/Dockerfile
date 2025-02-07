from osrf/ros:jazzy-simulation

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# # Install necessary bits
RUN apt update && apt install -y \
    sudo \
    git \
    wget \
    curl \
    lsb-release \
    gnupg \
    software-properties-common \
    ros-jazzy-xacro

# # Install Gazebo Harmonic (not needed if already in container)
# RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
#     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
#     apt update && apt install -y gz-harmonic

# Supercharge ubuntu user
RUN usermod -aG sudo ubuntu && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog
