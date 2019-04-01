FROM alpine:3.8

MAINTAINER SosOrg

RUN apk add --update --no-cache \ 
    perl \
	perl-dbi \
	perl-dbd-pg \
	git 

RUN cd / && git clone https://github.com/dataegret/pgcompacttable.git pgcompacttable

RUN chmod +x /pgcompacttable/bin/pgcompacttable

RUN ln -s /pgcompacttable/bin/pgcompacttable /usr/bin/pgcompacttable

RUN chmod +x /pgcompacttable/bin/pgcompacttable
RUN chmod +x /usr/bin/pgcompacttable

WORKDIR /pgcompacttable/bin

CMD ["pgcompacttable"]
