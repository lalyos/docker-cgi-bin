db-select() { 
    docker exec -it mydb bash -c "echo 'select * from person;' | psql -U postgres"
}
db-delete-all () { 
    docker exec -it mydb bash -c "echo 'delete from person;' | psql -U postgres"
}
db-restart () { 
    docker rm -f mydb;
    docker volume rm testdb1;
    sleep 3;
    docker run -d -v testdb1:/var/lib/postgresql/data -v /Users/lalyos/prj/invitech/dbscripts/:/docker-entrypoint-initdb.d --name=mydb -e POSTGRES_PASSWORD=secret postgres:12;
    sleep 3;
    docker exec -it mydb bash -c "echo 'select * from person;' | psql -U postgres"
}

web-restart() {
  docker build -t web:test .
  docker rm -f delme
  sleep 1
  docker run  -d\
    --name delme \
    -p 8081:80 \
    --link mydb:mydb \
    -e DEBUG=1 \
    -e TRACE=1 \
    web:test
    docker logs -f delme
}

full-restart() {
    db-restart
    web-restart
}

alias rr=full-restart
alias ss=db-select
alias r="source $PWD/$(basename ${BASH_SOURCE})"