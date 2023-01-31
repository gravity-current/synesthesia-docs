const express = require("express");
const path = require("path");
const app = express();
const port = 8000;

const DOWNLOAD_EMBEDDED_ROUTE = "/docs/api/v1/download/embedded";
const EMBEDDED_DOCS_PATH = "build/private/embedded_docs.zip"
const PUBLIC_DOCS_PATH = "build/public";

app.use(express.static(PUBLIC_DOCS_PATH));

app.get(DOWNLOAD_EMBEDDED_ROUTE, (req, res) => {
	console.log("Downloading embedded docs");
	res.sendFile(path.resolve(EMBEDDED_DOCS_PATH));
});

app.listen(port, () => {
	console.log(`Server is listening on port ${port}`);
})