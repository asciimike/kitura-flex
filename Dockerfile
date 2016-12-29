##
# Copyright Michael McDonald 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Builds a Docker image with all the dependencies for compiling and running the
# Kitura-Starter sample application on Google App Engine Flexible

FROM ibmcom/swift-ubuntu:latest
LABEL Description="Docker image for Swift + Kitura on GAE Flex."

# Expose default port for Kitura
EXPOSE 8080

RUN mkdir /root/Kitura-Flex

ADD Sources /root/Kitura-Flex
ADD Package.swift /root/Kitura-Flex
ADD LICENSE /root/Kitura-Flex

RUN cd /root/Kitura-Flex && swift build

USER root
CMD ["/root/Kitura-Flex/.build/debug/Kitura-Flex"]
