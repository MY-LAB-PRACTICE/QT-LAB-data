Docker file for Springpetclinic
------------------------------------
FROM amazoncorretto:17.0.8
LABEL author="sridhar"
ADD target/springpetclinic-3.0.0-SNAPSHOT.jat /springpetclinic.jar
EXPOSE 8080
CMD ["java","-jar","/springpetclinic.jar"]


============================================================================================

                        Dockerfile for Nop-Basefile
                        ----------------------------

FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL key="value" author="sridhar" organization="samskrtui" project="mtech"
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip /nop/nopCommerce_4.60.2_NoSource_linux_x64.zip
WORKDIR /nop/
EXPOSE 5000
RUN apt update && apt install unzip -y && \
    unzip nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir bin && mkdir logs
CMD ["dotnet","Nop.Web.dll","--urls","http://0.0.0.0:5000"]

=====================================================================================================
                            NOP-COMMERSCE with ENV&ARGUMENTS

                          
FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL key="value" author="sridhar" organization="samskrtui" project="mtech"
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip
ARG HOME_DIR=/nop
ADD ${DOWNLOAD_URL} /${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip
WORKDIR ${HOME_DIR}/
EXPOSE 5000
RUN apt update && apt install unzip -y && \
    unzip ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir ${HOME_DIR}/bin && ${HOME_DIR}/mkdir logs
ENV ASPNETCORES="http://0.0.0.0:5000"    
CMD ["donet","Nop.Web.dll"]


====================================================================
  
               NOP-with users & groups
               -----------------------

FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="sridhar" organization="samskrtui" project="mtech"
ARG user=nopCommerce
ARG group=nopCommerce
ARG uid=1000
ARG gid=1000
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip
ARG HOME_DIR=/nop
##ADD ${DOWNLOAD_URL} /${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip(no need this line)
RUN apt update && apt install unzip -y 
#### add nopcommerce to group
RUN groupadd -g ${gid} ${group} \
    && useradd -d "${HOME_DIR}" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
USER ${user}
WORKDIR ${HOME_DIR}
ADD --chown=${user}:${group} ${DOWNLOAD_URL} ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip
RUN unzip ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir ${HOME_DIR}/bin && mkdir ${HOME_DIR}/logs
EXPOSE 5000
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"

----------------------------------------------------------------------------------------------------








