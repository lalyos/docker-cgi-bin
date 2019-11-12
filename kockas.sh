ss is a function
ss () 
{ 
    docker exec -it mydb bash -c "echo 'select * from person;' | psql -U postgres"
}
dd is a function
dd () 
{ 
    docker exec -it mydb bash -c "echo 'delete from person;' | psql -U postgres"
}
rr is a function
rr () 
{ 
    docker rm -f mydb;
    docker volume rm testdb1;
    sleep 3;
    docker run -d -v testdb1:/var/lib/postgresql/data -v /Users/lalyos/prj/invitech/dbscripts/:/docker-entrypoint-initdb.d --name=mydb -e POSTGRES_PASSWORD=secret postgres:12;
    sleep 3;
    docker exec -it mydb bash -c "echo 'select * from person;' | psql -U postgres"
}
