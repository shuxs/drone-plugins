# docker build -t shuxs/alpine4net:latest -f alpine4net.Dockerfile . && docker push shuxs/alpine4net:latest
FROM shuxs/alpine:latest

RUN \
  apk add --no-cache \
  ca-certificates \
  # .NET Core dependencies
  krb5-libs \
  libgcc \
  libintl \
  libssl1.1 \
  libstdc++ \
  tzdata \
  userspace-rcu \
  zlib \
  lttng-ust \
  && rm -rf /var/cache/apk/*

ENV \
  # Configure web servers to bind to port 80 when present
  ASPNETCORE_URLS=http://+:80 \
  # Enable detection of running in a container
  DOTNET_RUNNING_IN_CONTAINER=true \
  # Set the invariant mode since icu_libs isn't included (see https://github.com/dotnet/announcements/issues/20)
  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
