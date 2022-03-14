## SQL Package command to export data
sqlpackage /a:export /scs:"Server=cgsidcf2mj.database.windows.net;Database=quantsis_db;User Id=sqlquantsis@cgsidcf2mj;Password=ConnB2820SQL;" /tf:"./quantsis_db.bacpac"

## Link to sqlpackage docker image
https://github.com/ormico/sqlpackage-docker/blob/master/Dockerfile