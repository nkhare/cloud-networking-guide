LABS=cloud-networking-guide.adoc \
	content/networking_basics/networking_basics.adoc \
	content/iptables/iptables.adoc \
	content/openstack_networking/openstack_networking.adoc \
        content/docker_networking/docker_networking.adoc 

all: $(LABS) cloud-networking-guide

cloud-networking-guide: $(LABS)
	asciidoc -v cloud-networking-guide.adoc
	a2x -fpdf -dbook --fop --no-xmllint -v cloud-networking-guide.adoc
	$(foreach lab,$(LABS), asciidoc -v $(lab);)

html: $(LABS) 
	asciidoc -v cloud-networking-guide.adoc
	asciidoc --backend 
	$(foreach lab,$(LABS), asciidoc -v $(lab);)

pdf: $(LABS) 
	a2x -fpdf -dbook --fop --no-xmllint -v cloud-networking-guide.adoc

epub: $(LABS) $(SLIDES)
	a2x -fepub -dbook --no-xmllint -v cloud-networking-guide.adoc

clean:
	find . -type f -name \*.html -exec rm -f {} \;
	find . -type f -name \*.pdf -exec rm -f {} \;
	find . -type f -name \*.epub -exec rm -f {} \;
	find . -type f -name \*.fo -exec rm -f {} \;
	find . -type f -name \*.xml -exec rm -f {} \;
