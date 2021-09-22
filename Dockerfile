FROM node:14-alpine

# Install:
RUN apk update && \
   apk add --no-cache curl bash git netcat-openbsd
	
# Install Git command line completion
RUN curl https://raw.githubusercontent.com/git/git/v2.20.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash && \
    echo "[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash" >> ~/.bashrc

# Setup create-react-app script to run in .devcontainer postCreateCommand
RUN mkdir /.initScripts
COPY init.sh /.initScripts/
RUN chmod o+x /.initScripts/init.sh

# setup profile
COPY alias /root/.alias
RUN chmod a+x /root/.alias

COPY ashrc /root/.ashrc
RUN chmod a+x /root/.ashrc

ENV ENV="/root/.ashrc"


# Set the work directory
RUN mkdir /projects
WORKDIR /projects

EXPOSE 8080
EXPOSE 8000
EXPOSE 3000
EXPOSE 3001