# GCC support can be specified at major, minor, or micro version
# (e.g. 14, 14.2 or 14.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC tags.
FROM gcc:15

WORKDIR /usr/src/myapp
COPY . .

# Compile the app and create a non-root user
RUN g++ -o myapp main.cpp \
    && useradd --create-home appuser

USER appuser

# This command runs your application, comment out this line to compile only
CMD ["./myapp"]
