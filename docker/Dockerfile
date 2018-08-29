FROM debian:stretch-slim

# This is for osslsigncode
# ADD dividedmind.pub /tmp
# RUN apt-key add - < /tmp/dividedmind.pub && rm /tmp/dividedmind.pub
# RUN echo 'deb http://download.opensuse.org/repositories/home:/dividedmind:/conjur/Debian_7.0/ /' >> /etc/apt/sources.list.d/dividedmind.list

RUN apt-get update -y && \
    apt-get install -y git wget apt-transport-https gpg dirmngr

# Install dotnet core
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ &&\
    wget -q https://packages.microsoft.com/config/debian/9/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
    apt-get update -y && \
    apt-get install -y dotnet-sdk-2.1.202

# Install mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update -y && \
    apt-get install -y mono-devel nunit-console osslsigncode nuget

RUN ln -s /src/docker/build.sh /
CMD /build.sh

#ADD packages.config /packages/
#RUN nuget restore /packages/packages.config -PackagesDirectory /packages
