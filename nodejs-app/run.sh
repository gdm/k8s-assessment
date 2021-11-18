

echo -n '  MONGODB_URL: ' >> secret.yml
echo -n "mongodb+srv://u11m:${DB_PASS}@cluster0.xi2pk.mongodb.net/myFirstDatabase?retryWrites=true&writeConcern=majority" | base64 -w0 >> secret.yml
echo "" >> secret.yml
