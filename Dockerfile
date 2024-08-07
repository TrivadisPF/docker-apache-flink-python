###############################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

###############################################################################
# Build PyFlink Playground Image
###############################################################################

FROM apache/flink:1.19.1-scala_2.12-java17
LABEL maintainer="Guido Schmutz"

ARG FLINK_VERSION=1.19.1

RUN set -ex; \
  apt-get update && \
  apt-get install -y python3 python3-pip python3-dev && rm -rf /var/lib/apt/lists/* \
  pip install apache-flink==${FLINK_VERSION};
  
RUN echo "taskmanager.memory.jvm-metaspace.size: 512m" >> /opt/flink/conf/flink-conf.yaml;

WORKDIR /opt/flink
