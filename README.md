================Steps to execute the program==========================
System requrements:
	Any system with docker installed
To execute from any IDE
=======================
1) Execute the below command to create the zalenium grid where the test cucumber test cases will be executed
	docker run --rm -dti --name zalenium -p 4444:4444 -p 5555:5555\
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /tmp/videos:/home/seluser/videos \
      --privileged dosel/zalenium start
2) Build the maven
3) Set the HUB_HOST(Zalenium port) and BROWSER(chrome/firefox) poperties to as System properties
3) Open the search.feature file and execute the Feature
4) The output can be visible on Console and under target folder