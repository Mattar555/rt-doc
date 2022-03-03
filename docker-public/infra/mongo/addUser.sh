#!/bin/bash
set -e

mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.getSiblingDB('$MONGODB_DBOS_DATABASE').createUser({user: '$MONGODB_DBOS_USER', pwd: '$MONGODB_DBOS_PASSWORD', roles: [{ role: 'dbOwner', db: '$MONGODB_DBOS_DATABASE' }]},{w: 'majority',wtimeout: 5000});"
mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.getSiblingDB('$MONGODB_SCENARIO_DATABASE').createUser({user: '$MONGODB_SCENARIO_USER', pwd: '$MONGODB_SCENARIO_PASSWORD', roles: [{ role: 'dbOwner', db: '$MONGODB_SCENARIO_DATABASE' }]},{w: 'majority',wtimeout: 5000});"
mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.getSiblingDB('$MONGODB_EXECUTION_DATABASE').createUser({user: '$MONGODB_EXECUTION_USER', pwd: '$MONGODB_EXECUTION_PASSWORD', roles: [{ role: 'dbOwner', db: '$MONGODB_EXECUTION_DATABASE' }]},{w: 'majority',wtimeout: 5000});"
mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.getSiblingDB('$MONGODB_PERMISSION_DATABASE').createUser({user: '$MONGODB_PERMISSION_USER', pwd: '$MONGODB_PERMISSION_PASSWORD', roles: [{ role: 'dbOwner', db: '$MONGODB_PERMISSION_DATABASE' }]},{w: 'majority',wtimeout: 5000});"
mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.getSiblingDB('$MONGODB_SESSION_TRACKING_DATABASE').createUser({user: '$MONGODB_SESSION_TRACKING_USER', pwd: '$MONGODB_SESSION_TRACKING_PASSWORD', roles: [{ role: 'dbOwner', db: '$MONGODB_SESSION_TRACKING_DATABASE' }]},{w: 'majority',wtimeout: 5000});"
