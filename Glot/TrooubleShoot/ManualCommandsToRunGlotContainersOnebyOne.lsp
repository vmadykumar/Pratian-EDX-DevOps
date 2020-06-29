pratiandevops/glot-snippets
pratiandevops/glot-couchdb
pratiandevops/couchdb-new
pratiandevops/snippets-new
--link hungry_sutherland:couchdb

1.# command to run couchdb (c579287a9bc5)
docker run -p 5984:5984 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -d couchdb
#(this commands will create batabase in couchdb with name snippets)
curl -X PUT http://admin:password@127.0.0.1:5984/snippets 

#Retrieving the list of databases yet again shows some useful results:
curl -X GET http://admin:password@127.0.0.1:5984/_all_dbs

#This command will delete the database "plankton":
curl -X DELETE http://admin:password@127.0.0.1:5984/plankton


http://192.168.0.107:8090

3. #command to run glot-snippet (63dbf5b70f86)
docker run -p 8090:8090 -e API_ENVIRONMENT=production -e API_HTTP_LISTEN_IP=0.0.0.0 -e API_HTTP_LISTEN_PORT=8090 -e LOG_PATH=/home/app/log/ -e BASE_URL=http://13.126.173.142:8090 -e ADMIN_TOKEN=password@123 -e DB_URL=http://13.126.173.142:5984 -e DB_USER=admin -e DB_PASSWORD=password -d javierprovecho/glot-snippets 
or 
docker run -p 8090:8090 --env-file=env-glot-snippet -d javierprovecho/glot-snippets
global urL : http://43.254.161.195:8090/(pratian env)

2. # command to run postgressql (8ebda6a7e791)
docker run -p 5432:5432 -e POSTGRES_USER=glot -e POSTGRES_PASSWORD=password@123 -e POSTGRES_DB=glot -d postgres

4. #command to run glot-www (9b0fff7dea7b)
docker run -p 3000:3000 --env-file=env-glot-www -d javierprovecho/glot-www

5. #command to run glot-run
docker run -p 8091:8091 --env-file=env-glot-run -d javierprovecho/glot-run( this is not latest image and not giving the output when we run code )
docker run -p 8091:8091 --env-file=env-glot-run -d packetcode/glotrun (it's not working image is missing from docker hub)
docker run -p 8091:8091 --env-file=env-glot-run -d ssoor/glot-run (we should use this one as this is latest image and working )
or
global urL : http://43.254.161.195:8091/ (pratian env)
docker run -p 8091:8091 -e 

6. #command to run container (glot)
docker run -p 8092:8092 -d mienaikage/glot-test

glot-container 
docker run -p 9092:8092 -d glot/typescript:latest


this is very important command as we made chnages in docker demon settings and directly we are not able to pull images from docker hub so to overcome this use below command

docker -H tcp://192.168.0.27:2375 run hello-world (to pull and run image at same time)
docker -H tcp://192.168.0.27:2375 pull hello-world (just to pull the image from docker hub)

for more details about above: go to this https://github.com/prasmussen/glot-run/issues/