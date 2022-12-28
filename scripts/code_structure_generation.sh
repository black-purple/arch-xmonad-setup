#! /bin/sh


local htmlTemplate='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <script src="./index.js" defer></script>
    <title>Home</title>
</head>
<body>
    
</body>
</html>'
local serverFile='import express from "express";
import dotenv from "dotenv";

const app = express();
dotenv.config();
app.use(express.json());
app.use(express.static("public"));


app.use((req, res, next) => {
    let requestInfo = `
====================================================
    Entering Request Information:
====================================================
    Request Method:     |   ${req.method}
====================================================
    Request Protocol:   |   ${req.protocol}
====================================================
    Request Host:       |   ${req.get("host")}
====================================================
    Request Route:      |   ${req.path}
====================================================
`;
    console.log(requestInfo);
    next();
});

app.get("/", (req, res) => {
    res.json({ status: "Working!" });
});

const port = process.env.PORT || 8000;
app.listen(port, () => {
    console.log("Listening on port", port);
});
'

nodeapi() {
    if [ -z "$1" ]; then
    mkdir "expressapi" && cd "$_"
    npm i express mysql2 sequelize dotenv
    npm i --save-dev nodemon
    else
    mkdir "$1" && cd "$_"
    npm i express mysql2 sequelize dotenv
    npm i --save-dev nodemon
    fi
}

nodeapifs() {
    if [ -z "$1" ]; then
        mkdir -p models views controllers db routes public/img
        touch routes/routes.env.js\
        controllers/controllers.env.js\
        public/index.css\
        public/index.js
        echo `head -n -1 package.json` > package.json
        echo ',"type": "module"}' >> package.json
        echo "$htmlTemplate" > views/index.html
        echo "$serverFile" > index.js
    else
        cd "$1"
        mkdir -p models views controllers db routes public/img
        touch routes/routes.env.js\
        controllers/controllers.env.js\
        public/index.css\
        public/index.js
        echo `head -n -1 package.json` > package.json
        echo ',"type": "module"}' >> package.json
        echo "$htmlTemplate" > views/index.html
        echo "$serverFile" > index.js
    fi
}

nodeapiwfs() {
    nodeapi
    nodeapifs
}

nfa() {
    if [ -z "$1" ]; then
        flutter create new_flutter_proj
    else
        flutter create "$1"
    fi
}