# GCC support can be specified at major, minor, or micro version
# (e.g. 14, 14.2 or 14.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC tags.
FROM gcc:14

WORKDIR /usr/src/myapp
COPY . .

# This command compiles your app using GCC, adjust for your source code
RUN g++ -o myapp main.cpp

RUN useradd --create-home appuser
USER appuser

# This command runs your application, comment out this line to compile only
CMD ["./myapp"]

LABEL Name=dockerfilesamples Version=0.0.2
