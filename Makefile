
RALLY=		$(HOME)/rally

RALLY_CONF=	$(RALLY)/etc/rally/rally.conf
RALLY_DB=	$(RALLY)/database/rally.sqlite

CACERT=		/etc/pki/ca-trust/source/anchors/ipnett.pem
DEPLOYMENT=	se-lab



all:

setup-virtualenv:
	cd $(HOME); curl https://raw.githubusercontent.com/openstack/rally/master/install_rally.sh | bash
	install -m 444 $(CACERT) $(RALLY)/lib/python2.7/site-packages/requests/cacert.pem

create:
	#install -m 444 rally.conf.template $(RALLY_CONF)
	rally deployment create --filename $(DEPLOYMENT).json --name $(DEPLOYMENT)

run:
	rally task start testcases/boot-and-delete-local.json

clean:
	rally deployment destroy

realclean:
	rm -f $(RALLY_DB)
	rally-manage db create
