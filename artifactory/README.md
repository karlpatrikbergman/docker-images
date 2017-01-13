# Artifactory as docker container test
## Run Artifactory as docker container without mounting data volumes
When I run Artifactory as docker container without mounting everything
seems to work fine. After logging in to the web gui I can see the
pre-configured Docker registries. Any changes I make such as adding
users, groups, perminssions etc will not be persisted on container stop/start though.

***

## Running Artifactory as docker container and mounting unnamed data volumes
Again everything seems fine. After logging in I see the pre-configured
docker registries.  

### Persitence test
1. Login to Artifactory as admin via web gui
2. Add test user "polly"
3. Stop and start the Artifactory docker container
4. Login to Artifactory again
5. The added user is still there (and my trial license is still active)

If I delete the container the changes I made will not be persisted.

***

## Running Artifactory as docker container and mounting named data volumes
Yet again I can see pre-configured docker registries.

### Persistence test
1. Login to Artifactory as admin via web gui
2. Add test user "polly"
3. Stop, delete, and create/run the Artifactory docker container
4. Login to Artifactory again
5. The added user is still there (and my trial license is still active)

Even if I delete the artifactory container the changes I made should
be persisted.

***

## Running Artifactory as docker container an mounting host directories
Now I run into trouble it seems. When I log in to Artifactory via the
web gui I can't see any docker registries. Is this a bug or have I
missed something?
