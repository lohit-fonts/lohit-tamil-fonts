all: sfd-dist ttf woff eot ttf-dist web-dist  

version:= 2.91.3
font_name:= "lohit-tamil"
font_filename:= "Lohit-Tamil"
conf_filename:= "66-lohit-tamil-fonts.conf"
source_dir:= "src"
script_dir:= "scripts"
sfntly:= "java -jar /usr/share/java/sfnttool.jar"

test: test-ttf
	@echo "----------Testing actual-output with expected-output----------"
	python3 $(script_dir)/auto_test.py std-test-out.txt Lohit-Tamil.ttf

ttf: ttf-bin
	@echo "----------Generating ttf from sfd file----------"
	python3 $(script_dir)/apply_featurefile.py $(source_dir)/Lohit-Tamil.sfd $(source_dir)/Lohit-Tamil.fea
	./generate.pe $(source_dir)/*.sfd
	@echo "----------Finished generating ttf file----------"
	@echo " "

woff: woff-bin
	@echo "----------Generating woff from ttf file----------"
	java -jar /usr/share/java/sfnttool.jar -w $(font_filename).ttf $(font_filename).woff
	@echo "----------Finished generating woff file----------"
	@echo " "

eot: eot-bin
	@echo "----------Generating eot from ttf file----------"
	java -jar /usr/share/java/sfnttool.jar -e -x $(font_filename).ttf $(font_filename).eot
	@echo "----------Finished generating eot file----------"
	@echo " "

ttf-dist: dist
	mkdir -p lohit-tamil-ttf-$(version)
	cp -p COPYRIGHT OFL.txt $(source_dir)/test-*.txt README.md  AUTHORS ChangeLog $(source_dir)/$(conf_filename) $(font_filename).ttf $(font_name)-ttf-$(version)
	rm -rf lohit-tamil-ttf-$(version)/.git
	tar -czvf $(font_name)-ttf-$(version).tar.gz $(font_name)-ttf-$(version)
	rm -rf $(font_name)-ttf-$(version)

sfd-dist: dist
	mkdir -p $(font_name)-$(version)
	cp -p COPYRIGHT OFL.txt $(source_dir)/test-*.txt README.md  AUTHORS generate*.pe $(script_dir)/apply_featurefile.py $(script_dir)/auto_test.py $(source_dir)/*.fea Makefile ChangeLog $(source_dir)/$(conf_filename) $(source_dir)/Lohit-Tamil.sfd $(source_dir)/std-test-out.txt $(font_name)-$(version)
	rm -rf lohit-tamil-$(version)/.git
	rm -rf lohit-tamil-$(version)/*.ttf
	tar -czvf $(font_name)-$(version).tar.gz $(font_name)-$(version)
	rm -rf $(font_name)-$(version)

web-dist: webdist
	mkdir -p $(font_name)-web-$(version)
	cp -p COPYRIGHT OFL.txt $(source_dir)/test-*.txt README.md  AUTHORS ChangeLog $(font_filename).woff  $(font_filename).eot $(font_name)-web-$(version)
	rm -rf $(font_name)-web-$(version)/.git
	tar -czvf $(font_name)-web-$(version).tar.gz $(font_name)-web-$(version)
	rm -rf $(font_name)-web-$(version)

clean: cleanall
	rm -f *.ttf *.eot *.woff
	rm -rf *.tar.gz
	rm -rf lohit-tamil*

.PHONY: ttf-bin woff-bin eot-bin webdist dist cleanall version test-ttf
